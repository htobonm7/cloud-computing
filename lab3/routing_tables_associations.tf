# Route Table Associations docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

###############################################################################
# Availability Zone A.

resource "aws_route_table_association" "public_sn_rt_a" {
  subnet_id      = aws_subnet.lab3_public_subnet_a.id
  route_table_id = aws_route_table.lab3_public_route_table_a.id
}

resource "aws_route_table_association" "private_sn_rt_a" {
  subnet_id      = aws_subnet.lab3_private_subnet_a.id
  route_table_id = aws_route_table.lab3_private_route_table_a.id
}

###############################################################################
# Availability Zone B.

resource "aws_route_table_association" "public_sn_rt_b" {
  subnet_id      = aws_subnet.lab3_public_subnet_b.id
  route_table_id = aws_route_table.lab3_public_route_table_b.id
}

resource "aws_route_table_association" "private_sn_rt_b" {
  subnet_id      = aws_subnet.lab3_private_subnet_b.id
  route_table_id = aws_route_table.lab3_private_route_table_b.id
}