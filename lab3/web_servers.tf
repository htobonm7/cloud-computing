# EC2 Instances docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

###############################################################################
# Web Server.

resource "aws_instance" "lab3_web_server" {
  ami           = var.amazon_linux_2_ami_id
  instance_type = "t2.micro"

  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.lab3_sg_http_global.id]
  subnet_id                   = aws_subnet.lab3_private_subnet_a.id

  key_name = var.key_pair_name

  tags = {
    Name = "Lab3 - Web Server"
  }
}
