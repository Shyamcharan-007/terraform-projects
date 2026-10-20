
module "vpc" {
  source = "./terraform_modules/modules/vpc"
  cidr   = var.cidr
}

module "subnet" {
  source = "./terraform_modules/modules/subnet"
  vpc    = module.vpc.vpc_id
  subnet_1 = var.subnet_1
  subnet_2 = var.subnet_2
}

module "internet_gateway" {
  source = "./terraform_modules/modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source   = "./terraform_modules/modules/routing_tables"
  vpc      = module.vpc.vpc_id
  igw_id   = module.internet_gateway.igw_id
  subnet_1 = module.subnet.sub1_id
  subnet_2 = module.subnet.sub2_id
}

module "security_groups" {
  source   = "./terraform_modules/modules/security_groups"
  vpc      = module.vpc.vpc_id
  ssh_cidr = var.ssh_cidr
}

module "s3" {
  source = "./terraform_modules/modules/s3"
}
module "instance" {
  source            = "./terraform_modules/modules/instance"
  instance_type     = var.instance_type
  ami               = var.ami_id
  subnet_1          = module.subnet.sub1_id
  subnet_2          = module.subnet.sub2_id
  security_group_id = module.security_groups.mysg_id
}

module "target_groups" {
  source    = "./terraform_modules/modules/target_groups"
  vpc       = module.vpc.vpc_id
  instance1 = module.instance.ins1_id
  instance2 = module.instance.ins2_id
}

module "load_balancer" {
  source           = "./terraform_modules/modules/load_balancer"
  alb_sg_id        = module.security_groups.mysg_id
  subnet_1         = module.subnet.sub1_id
  subnet_2         = module.subnet.sub2_id
  target_group_arn = module.target_groups.aws_target_group_arn

}







