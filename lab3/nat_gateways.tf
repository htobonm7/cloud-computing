# NAT Gateway docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

# WARNING: AWS Educate accounts can't create NAT Gateways.
# I created instead the NAT Instances through the GUI together with the corresponding
# security groups.

###############################################################################
# Variables.

# AMI ID of: amzn-ami-vpc-nat-hvm-2018.03.0.20181116-x86_64-ebs.
variable "amazon_vpc_nat_ami_id" {
  type    = string
  default = "ami-00a9d4a05375b2763"
}

###############################################################################
# NAT Instances.

resource "aws_instance" "lab3_nat_instance_a" {
  ami           = var.amazon_vpc_nat_ami_id
  instance_type = "t2.micro"

  security_groups = [aws_security_group.lab3_sg_nat_instances.id]
  subnet_id       = aws_subnet.lab3_public_subnet_a.id

  key_name = var.key_pair_name

  tags = {
    Name = "Lab3 - NAT Instance A"
  }
}

resource "aws_eip_association" "lab3_nat_instance_eip_a" {
  instance_id   = aws_instance.lab3_nat_instance_a.id
  allocation_id = aws_eip.lab3_eip_nat_a.id
}

resource "aws_instance" "lab3_nat_instance_b" {
  ami           = var.amazon_vpc_nat_ami_id
  instance_type = "t2.micro"

  security_groups = [aws_security_group.lab3_sg_nat_instances.id]
  subnet_id       = aws_subnet.lab3_public_subnet_b.id

  key_name = var.key_pair_name

  tags = {
    Name = "Lab3 - NAT Instance B"
  }
}

resource "aws_eip_association" "lab3_nat_instance_eip_b" {
  instance_id   = aws_instance.lab3_nat_instance_b.id
  allocation_id = aws_eip.lab3_eip_nat_b.id
}

# resource "aws_nat_gateway" "lab3_nat_gw_a" {
#   # Assing elastic IP.
#   allocation_id = aws_eip.lab3_eip_nat_a.id

#   subnet_id = aws_subnet.lab3_public_subnet_a.id

#   tags = {
#     Name = "Lab3 - NAT GW A"
#   }
# }

# resource "aws_nat_gateway" "lab3_nat_gw_b" {
#   # Assing elastic IP.
#   allocation_id = aws_eip.lab3_eip_nat_b.id

#   subnet_id = aws_subnet.lab3_public_subnet_b.id

#   tags = {
#     Name = "Lab3 - NAT GW B"
#   }
# }
