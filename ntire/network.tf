resource "aws_vpc" "primary_network" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ntire_dummy"
    Env = "Dev"
    createBy = "terraform" 

  }
}