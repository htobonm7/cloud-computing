# VPC docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "lab3_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "Lab3 - VPC"
  }
}

output "vpc_id" {
  value       = aws_vpc.lab3_vpc.id
  description = "VPC's id."
  sensitive   = false
}
