# Route table docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route_table

###############################################################################
# Availability Zone A.

resource "aws_route_table" "lab3_public_route_table_a" {
  vpc_id = aws_vpc.lab3_vpc.id

  route {
    cidr_block = "0.0.0.0/0"                      # Destination.
    gateway_id = aws_internet_gateway.lab3_igw.id # Target.
  }

  tags = {
    Name = "Lab3 - Public RT A"
  }
}

resource "aws_route_table" "lab3_private_route_table_a" {
  vpc_id = aws_vpc.lab3_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"                         # Destination.
    instance_id = aws_instance.lab3_nat_instance_a.id # Target.
    # nat_gateway_id = aws_nat_gateway.lab3_nat_gw_a.id # Target.
  }

  tags = {
    Name = "Lab3 - Private RT A"
  }
}

###############################################################################
# Availability Zone B.

resource "aws_route_table" "lab3_public_route_table_b" {
  vpc_id = aws_vpc.lab3_vpc.id

  route {
    cidr_block = "0.0.0.0/0"                      # Destination.
    gateway_id = aws_internet_gateway.lab3_igw.id # Target.
  }

  tags = {
    Name = "Lab3 - Public RT B"
  }
}

resource "aws_route_table" "lab3_private_route_table_b" {
  vpc_id = aws_vpc.lab3_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"                         # Destination.
    instance_id = aws_instance.lab3_nat_instance_b.id # Target.
    # nat_gateway_id = aws_nat_gateway.lab3_nat_gw_b.id # Target.
  }

  tags = {
    Name = "Lab3 - Private RT B"
  }
}
