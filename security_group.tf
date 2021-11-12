
resource "aws_security_group" "instance" {
  name        = "openvpn-default"
  description = "OpenVPN security group"

dynamic "ingress"{
  for_each = ["22","80","443","943",945]
  content {
      description      = "ingress SSH from VPC"
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
  }
}
  ingress {
      from_port   = 1194
      to_port     = 1194
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  egress = [
    {
      description      = "Allow egress from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  tags = {
    Name = "Dynamic security group"
    Project = "OpenVPN"
  }
}

