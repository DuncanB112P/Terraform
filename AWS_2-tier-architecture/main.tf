terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


##############################################################################

module "custom_vpc" {
  source = "./modules/vpc"
}


module "web_security_group" {
  source        = "./modules/security_group"
  custom_vpc_id = module.custom_vpc.custom_vpc_id
}


module "web_ec2" {
  source            = "./modules/ec2"
  web_sg_id         = module.web_security_group.web_sg_id
  public_subnet1_id = module.custom_vpc.public_subnet1_id
  public_subnet2_id = module.custom_vpc.public_subnet2_id
}


module "db_security_group" {
  source        = "./modules/security_group_db"
  custom_vpc_id = module.custom_vpc.custom_vpc_id
  web_sg_id     = module.web_security_group.web_sg_id
}

module "rds_database" {
  source               = "./modules/db"
  custom_vpc_id        = module.custom_vpc.custom_vpc_id
  db_security_group_id = module.db_security_group.db_security_group_id
  private_subnet1_id   = module.custom_vpc.private_subnet1_id
  private_subnet2_id   = module.custom_vpc.private_subnet2_id
}






######################     OUTPUTS     ########################################

output "web_public1_IP" {
  value = module.web_ec2.web_server1_public_IP
}

output "web_public2_IP" {
  value = module.web_ec2.web_server2_public_IP
}

