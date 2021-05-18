# Security groups docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group

###############################################################################
# For Bastion Hosts.

resource "aws_security_group" "lab3_sg_bastion_hosts" {

  description = "Allow SSH access to Bastion Hosts."
  vpc_id      = aws_vpc.lab3_vpc.id

  ingress {
    description = "Allow SSH access."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Lab3 - SG Bastion Hosts"
  }
}

###############################################################################
# For NAT Instances.

resource "aws_security_group" "lab3_sg_nat_instances" {

  description = "Allow HTTP, HTTPS, SSH to NAT Instances traffics."
  vpc_id      = aws_vpc.lab3_vpc.id

  ingress {
    description = "Allow HTTP access from private subnets."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["172.16.2.0/24", "172.16.4.0/24"]
  }

  ingress {
    description = "Allow HTTPS access from private subnets."
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.16.2.0/24", "172.16.4.0/24"]
  }

  ingress {
    description = "Allow SSH access."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Lab3 - SG NAT GWs"
  }
}
