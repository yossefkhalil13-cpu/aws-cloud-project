variable "aws_region" {
  default = "eu-west-1"
}

provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
