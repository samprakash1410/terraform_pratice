resource "aws_vpc" "primary_network" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "ntire_primary_dummy"
  }
}

resource "aws_subnet" "subnets" {
count = var.subnetcount
vpc_id = aws_vpc.primary_network.id
cidr_block = var.subnet_cidr[count.index]
}