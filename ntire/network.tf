resource "aws_vpc" "primary_network" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ntire_primary_dummy"
  }
}



resource "aws_subnet" "dummy-1 web" {
  cidr_block = "10.100.0.0/24"
  vpc_id     = aws_vpc.primary_network.id
  tags = {
    Name = "dummy-1 web"

  }
}