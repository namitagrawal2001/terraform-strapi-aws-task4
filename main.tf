module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  instance_id = module.ec2.instance_id
}

module "ec2" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id
  private_subnet_id = module.vpc.public_subnets[0]
  alb_sg = module.alb.alb_sg
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
}
