terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.40.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

###############################################################################
# Global variables.

variable "key_pair_name" {
  type    = string
  default = "cc-htobonm"
}

# AMI ID of: Amazon Linux 2 AMI (HVM), SSD Volume Type.
variable "amazon_linux_2_ami_id" {
  type    = string
  default = "ami-0d5eff06f840b45e9"
}
