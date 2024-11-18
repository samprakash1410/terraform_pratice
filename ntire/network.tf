resource "aws_vpc" "primary_network" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "ntire_primary_dummy"
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.primary_network.id
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }
}

module "web_security_group" {
  source = "./path/to/my_security_group"
  security_group_info = {
    name        = "web"
    description = "this is web security group"
    vpc_id      = aws_vpc.primary_network.id
    rules = [{
      from_port   = "22"
      to_port     = "22"
      type        = "ingress"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = "80"
        to_port     = "80"
        type        = "ingress"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = "443"
        to_port     = "443"
        type        = "ingress"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
  depends_on = [aws_vpc.primary_network, aws_subnet.subnets]
}

module "business_security_group" {
  source = "./modules/my_security_group"
  security_group_info = {
    name        = "business"
    description = "this is business security group"
    vpc_id      = aws_vpc.primary_network.id
    rules = [{
      from_port   = "0"
      to_port     = "65535"
      type        = "ingress"
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr]
      }
      
    ]
  }
}