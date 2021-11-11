resource "aws_instance" "openvpn" {
  ami                    = local.latest_ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name               = "${aws_key_pair.my-key.key_name}"

  user_data = "${file("user_data.sh")}"

  tags = {
    Name = "openvpn"
  }
}

resource "aws_eip" "myip" {

  instance = aws_instance.openvpn.id
  
}

resource "aws_key_pair" "my-key" {
	key_name = "mykeyNov2021"
	public_key = file("~/.ssh/id_rsa.pub")
}