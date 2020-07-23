terraform {
  required_version = "> 0.12.0"

  backend "s3" {
    bucket         = "pttp-ci-infrastructure-build-dns-dhcp-artifacts-bucket"
    dynamodb_table = "pttp-ci-infrastructure-client-core-tf-dns-dhcp-lock-table"
    region         = "eu-west-2"
  }
}

provider "aws" {
  version = "~> 2.68"
  alias   = "env"
  assume_role {
    role_arn = var.assume_role
  }
}

module "label" {
  source  = "cloudposse/label/null"
  version = "0.16.0"

  namespace = "staff-device"
  stage     = terraform.workspace
  name      = "dns-dhcp"
  delimiter = "-"

  tags = {
    "business-unit" = "MoJO"
    "application"   = "dns-dhcp",
    "is-production" = tostring(var.is_production),
    "owner"         = var.owner_email

    "environment-name" = "global"
    "source-code"      = "https://github.com/ministryofjustice/staff-device-dhcp-dns"
  }
}

data "aws_region" "current_region" {}
data "aws_caller_identity" "shared_services_account" {}

module "hello" {
  source      = "./modules/hello"
  prefix_name = module.label.id

  providers = {
    aws = aws.env
  }
}
