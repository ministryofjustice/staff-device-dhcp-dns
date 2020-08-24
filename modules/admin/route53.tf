resource "aws_route53_record" "admin_lb" {
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
  # name    = aws_acm_certificate.admin_lb.domain_validation_options.resource_record_name
  # type    = aws_acm_certificate.admin_lb.domain_validation_options.resource_record_type
  zone_id = var.vpn_hosted_zone_id
  # records = [aws_acm_certificate.admin_lb.domain_validation_options.resource_record_value]
  ttl     = 60

  for_each = {
    for dvo in aws_acm_certificate.admin_lb.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name    = each.value.name
  records = [each.value.record]
  type    = each.value.type

}
