locals {
  enable_custom_domain_name = var.enable_custom_domain_name ? 1 : 0
}

resource "aws_route53_record" "admin_lb" {
  count          = local.enable_custom_domain_name
  zone_id        = var.vpn_hosted_zone_id
  name           = "staff-device-admin-${var.short_prefix}.${var.vpn_hosted_zone_domain}"
  type           = "A"
  set_identifier = var.region

  alias {
    name                   = aws_lb.admin_alb.dns_name
    zone_id                = aws_lb.admin_alb.zone_id
    evaluate_target_health = true
  }

  latency_routing_policy {
    region = var.region
  }
}

resource "aws_route53_record" "admin_lb_verification" {
  count   = local.enable_custom_domain_name
  zone_id = var.vpn_hosted_zone_id
  ttl     = 60

  name    = tolist(aws_acm_certificate.admin_lb.domain_validation_options)[0].resource_record_name
  records = [tolist(aws_acm_certificate.admin_lb.domain_validation_options)[0].resource_record_value]
  type    = tolist(aws_acm_certificate.admin_lb.domain_validation_options)[0].resource_record_type

}

