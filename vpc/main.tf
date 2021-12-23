module "vpc" {
  source  = "app.terraform.io/legendary-org/module-vpc/aws"
  version = "0.0.1"
  
  application_name                      = var.application_name
  application_vpc_block                 = var.application_vpc_block
  application_public_subnets_ip_lists   = var.application_public_subnets_ip_lists 
  application_private_subnets_ip_lists  = var.application_private_subnets_ip_lists
}
