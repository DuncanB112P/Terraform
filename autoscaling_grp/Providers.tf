# Enable the S3 bucket "backendbucket-spd-dev-12102023" as a backend 

terraform {
  backend "s3" {
      bucket = "backendbucket-spd-dev-12102023"
      key    = "backend/tfstate"
      region = "us-east-1"
    }
# Require the AWS provider, version 5.29.0
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
}

#Configure the AWS provider for region us-east-1
provider "aws" {
  region = "us-east-1"
}