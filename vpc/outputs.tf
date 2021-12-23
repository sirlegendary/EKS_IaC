output "vpc_id" {
  value = module.vpc.application_vpc
}
output "private_subnets" {
  value = module.vpc.application_private_subnets
}
output "public_subnets" {
  value = module.vpc.application_public_subnets
}