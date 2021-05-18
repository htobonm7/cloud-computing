# RDS subnet group docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group
# RDS Instance docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance

###############################################################################
# RDS Subnet Group.

resource "aws_db_subnet_group" "lab3_rds_subnet_group" {
  # TODO: Fix this name: "-roup".
  name = "lab3-rds-subnet-roup"
  subnet_ids = [
    aws_subnet.lab3_private_subnet_a.id,
    aws_subnet.lab3_private_subnet_b.id
  ]

  tags = {
    Name = "Lab3 - RDS Subnet Group"
  }
}

###############################################################################
# RDS Instance.

# TODO: Fix this name: from default to lab3_rds_instance.
resource "aws_db_instance" "default" {
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "8.0.20"
  instance_class    = "db.t3.micro"
  name              = "wordpress"

  identifier           = "wordpress"
  username             = "wpuser"
  password             = "wppassword"
  db_subnet_group_name = "lab3-rds-subnet-roup"
  multi_az             = true
  port                 = 3306

  skip_final_snapshot = true
}