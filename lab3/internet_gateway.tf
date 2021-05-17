# IG docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway

resource "aws_internet_gateway" "lab3_igw" {
  vpc_id = aws_vpc.lab3_vpc.id

  tags = {
    Name = "Lab3 - IGW"
  }
}

output "igw_id" {
  value       = aws_internet_gateway.lab3_igw.id
  description = "IGW's id."
  sensitive   = false
}
