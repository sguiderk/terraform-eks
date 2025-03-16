terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0.5"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3.4"
    }
  }

  required_version = "~> 1.3"

  backend "s3" {
    bucket         = "<s3-bucket-name>"
    key            = "eks/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "<dynamodb-table-name>"
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Management = "Terraform"
    }
  }
}
