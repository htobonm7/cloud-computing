# EC2 Instances docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance

###############################################################################
# Bastion Hosts.

resource "aws_instance" "lab3_web_server_a" {
  ami           = var.amazon_linux_2_ami_id
  instance_type = "t2.micro"

  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.lab3_sg_bastion_hosts.id]
  subnet_id                   = aws_subnet.lab3_public_subnet_a.id

  key_name = var.key_pair_name

  tags = {
    Name = "Lab3 - Web Server A"
  }
}

resource "aws_instance" "lab3_web_server_b" {
  ami           = var.amazon_linux_2_ami_id
  instance_type = "t2.micro"

  associate_public_ip_address = false
  vpc_security_group_ids      = [aws_security_group.lab3_sg_bastion_hosts.id]
  subnet_id                   = aws_subnet.lab3_public_subnet_b.id

  key_name = var.key_pair_name

  tags = {
    Name = "Lab3 - Web Server B"
  }
}
