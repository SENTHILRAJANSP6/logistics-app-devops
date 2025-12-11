provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  env      = "dev"
}

module "subnets" {
  source      = "../../modules/subnets"
  vpc_id      = module.vpc.vpc_id
  public_cidr = "10.0.1.0/24"
  env         = "dev"
}

module "sg" {
  source = "../../modules/sg"
  vpc_id = module.vpc.vpc_id
  env    = "dev"
}

module "ecr" {
  source = "../../modules/ecr"
  env    = "dev"
}
