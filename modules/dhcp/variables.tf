variable "prefix" {
  type = string
}

variable "subnets" {
  type = list(string)
}

variable "env" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "dhcp_db_username" {
  type = string
}

variable "dhcp_db_password" {
  type = string
}

variable "dhcp_transit_gateway_id" {
  type = string
}

variable "enable_dhcp_transit_gateway_attachment" {
  type = bool
}

variable "transit_gateway_route_table_id" {
  type = string
}

variable "load_balancer_private_ip_eu_west_2a" {
  type = string
}

variable "load_balancer_private_ip_eu_west_2b" {
  type = string
}

variable "critical_notifications_arn" {
  type = string
}

variable "vpn_hosted_zone_id" {
  type = string
}

variable "vpn_hosted_zone_domain" {
  type = string
}

variable "short_prefix" {
  type = string
}

variable "region" {
  type = string
}

variable "is_publicly_accessible" {
  type = bool
}

variable "admin_local_development_domain_affix" {
  type = string
}

variable "dhcp_egress_transit_gateway_routes" {
  type = list(string)
}

variable "private_route_table_ids" {
  type = set(string)
}

variable "pdns_ips" {
  type = list(string)
}
