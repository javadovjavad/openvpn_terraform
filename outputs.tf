output "access_vpn_url" {
  value       = "https://${aws_instance.openvpn.public_ip}:943/admin"
  description = "The public url address of the vpn server"
}

output "access_vpn_url_with_eip" {
  value       = "https://${aws_eip.myip.public_ip}:943/admin"
  description = "The public EIP url address of the vpn server"
}

output "access_url_with_dnsname" {
  value       = "https://${aws_route53_record.www.name}:943/admin"
  description = "The public EIP url address of the vpn server"
}