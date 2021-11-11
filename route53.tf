data "aws_route53_zone" "selected" {
  name         = "darvaza.az"
  
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.${data.aws_route53_zone.selected.name}"
  type    = "A"
  ttl     = "60"
  records = [aws_eip.myip.public_ip]
}