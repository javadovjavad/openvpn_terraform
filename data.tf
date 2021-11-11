data "aws_acm_certificate" "server_vpn_certificate" {
  domain   = "your domain"
  statuses = ["ISSUED"]
}



resource "aws_ec2_client_vpn_endpoint" "origin_vpn" {
  description            = "Description of your client VPN"
  server_certificate_arn = data.aws_acm_certificate.server_vpn_certificate.arn
  client_cidr_block      = "your VPN CIDR block"

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = data.aws_acm_certificate.server_vpn_certificate.arn
  }

  connection_log_options {
    enabled              = true
    cloudwatch_log_group = aws_cloudwatch_log_group.vpn_log_group.name
  }

  dns_servers = ["10.0.0.2"]
}