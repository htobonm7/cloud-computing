# Elastic IPs docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "lab3_eip_nat_a" {

  # Explicit dependency.
  depends_on = [aws_internet_gateway.lab3_igw]

  tags = {
    Name = "Lab3 - EIP A"
  }
}

resource "aws_eip" "lab3_eip_nat_b" {
  depends_on = [aws_internet_gateway.lab3_igw]

  tags = {
    Name = "Lab3 - EIP B"
  }
}
