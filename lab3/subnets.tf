# Subnets doc: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

###############################################################################
# Availability Zone A.

# Public Subnet.
resource "aws_subnet" "lab3_public_subnet_a" {
  vpc_id     = aws_vpc.lab3_vpc.id
  cidr_block = "172.16.1.0/24"

  availability_zone = "us-east-1a"

  # Every instance launched on this subnet will be assigned a public IP.
  map_public_ip_on_launch = true

  tags = {
    Name = "Lab3 - Public SN A"
  }
}

# Private Subnet.
resource "aws_subnet" "lab3_private_subnet_a" {
  vpc_id     = aws_vpc.lab3_vpc.id
  cidr_block = "172.16.2.0/24"

  availability_zone = "us-east-1a"

  tags = {
    Name = "Lab3 - Private SN A"
  }
}

###############################################################################
# Availability Zone B.

# Public Subnet.
resource "aws_subnet" "lab3_public_subnet_b" {
  vpc_id     = aws_vpc.lab3_vpc.id
  cidr_block = "172.16.3.0/24"

  availability_zone = "us-east-1b"

  # Every instance launched on this subnet will be assigned a public IP.
  map_public_ip_on_launch = true

  tags = {
    Name = "Lab3 - Public SN B"
  }
}

# Private Subnet.
resource "aws_subnet" "lab3_private_subnet_b" {
  vpc_id     = aws_vpc.lab3_vpc.id
  cidr_block = "172.16.4.0/24"

  availability_zone = "us-east-1b"

  tags = {
    Name = "Lab3 - Private SN B"
  }
}
