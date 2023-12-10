terraform {
  backend "s3" {
      bucket = "backendbucket-spd-dev-12102023"
      key    = "backend/state"
      region = "us-east-1"
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}