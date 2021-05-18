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
