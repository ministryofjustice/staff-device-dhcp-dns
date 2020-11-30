variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "bastion_allowed_ingress_ip" {
  type = string
}

variable "bastion_allowed_egress_ip" {
  type = string
}

variable "transit_gateway_id" {
  type = string
}

variable "route_table_id" {
  type = string
}

variable "corsham_vm_ip" {
  type = string
}
