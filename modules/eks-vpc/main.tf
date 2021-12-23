resource "aws_vpc" "eks_cluster_vpc" {

    cidr_block = var.eks_cluster_vpc_block
    enable_dns_hostnames = true
    tags = {
            Name = "${var.cluster_name}-vpc"
        }
    lifecycle {
        ignore_changes = [
            tags
        ]
    }
}

resource "aws_internet_gateway" "eks_cluster_igw" {
    vpc_id = aws_vpc.eks_cluster_vpc.id
}

resource "aws_eip" "eks_cluster_eip" {
    count = length(var.eks_cluster_private_subnets_ip_lists)
    vpc   = true
}

resource "aws_nat_gateway" "eks_cluster_natgw" {
    count         = length(var.eks_cluster_public_subnets_ip_lists)
    allocation_id = element(aws_eip.eks_cluster_eip.*.id, count.index)
    subnet_id     = element(aws_subnet.eks_cluster_public_subnets.*.id, count.index)
  
}

data "aws_availability_zones" "eks_cluster_nodes_azs" {}

resource "aws_subnet" "eks_cluster_private_subnets" {

    count             = length(var.eks_cluster_private_subnets_ip_lists)
    cidr_block        = element(var.eks_cluster_private_subnets_ip_lists, count.index)
    vpc_id            = aws_vpc.eks_cluster_vpc.id
    availability_zone = data.aws_availability_zones.eks_cluster_nodes_azs.names[count.index]
    tags = {
            Name = "${var.cluster_name}-private-subnets-${data.aws_availability_zones.eks_cluster_nodes_azs.names[count.index]}"
        }
    lifecycle {
    ignore_changes = [
        tags
    ]
   }
}

resource "aws_route_table" "eks_cluster_private_route_table" {
  vpc_id   = aws_vpc.eks_cluster_vpc.id
  count    = length(var.eks_cluster_private_subnets_ip_lists)
}

resource "aws_route" "eks_cluster_private_route" {

    count                  = length(var.eks_cluster_private_subnets_ip_lists)
    route_table_id         = element(aws_route_table.eks_cluster_private_route_table.*.id, count.index)
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id      = element(aws_nat_gateway.eks_cluster_natgw.*.id, count.index)
    timeouts{
        create = "5m"
    } 
}

resource "aws_route_table_association" "eks_cluster_private_route_assoication" {
  count     = length(var.eks_cluster_private_subnets_ip_lists)
  route_table_id = element(aws_route_table.eks_cluster_private_route_table.*.id, count.index)
  subnet_id = element(aws_subnet.eks_cluster_private_subnets.*.id, count.index)
}

resource "aws_subnet" "eks_cluster_public_subnets" {

    count             = length(var.eks_cluster_public_subnets_ip_lists)
    cidr_block        = element(var.eks_cluster_public_subnets_ip_lists, count.index)
    vpc_id            = aws_vpc.eks_cluster_vpc.id
    availability_zone = data.aws_availability_zones.eks_cluster_nodes_azs.names[count.index]
    tags = {
            Name = "${var.cluster_name}-public-subnets-${data.aws_availability_zones.eks_cluster_nodes_azs.names[count.index]}"
        }
    lifecycle {
    ignore_changes = [
        tags
    ]
   }
}

resource "aws_route_table" "eks_cluster_public_route_table" {
  vpc_id   = aws_vpc.eks_cluster_vpc.id
}

resource "aws_route" "eks_cluster_public_route" {
  route_table_id = aws_route_table.eks_cluster_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.eks_cluster_igw.id
  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "eks_cluster_public_route_assoication" {
  count          = length(var.eks_cluster_public_subnets_ip_lists)
  route_table_id = aws_route_table.eks_cluster_public_route_table.id
  subnet_id      = element(aws_subnet.eks_cluster_public_subnets.*.id, count.index)
}
