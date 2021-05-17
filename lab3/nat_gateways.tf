# NAT Gateway docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

# WARNING: AWS Educate accounts can't create NAT Gateways.
# I created instead the NAT Instances through the GUI together with the corresponding
# security groups.

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
