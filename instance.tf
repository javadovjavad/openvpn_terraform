resource "aws_instance" "openvpn" {
  ami                    = local.latest_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = file(user_data.sh)

  tags = {
    Name = "openvpn"
  }
}
