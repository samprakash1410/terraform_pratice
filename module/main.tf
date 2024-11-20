module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "scoobydo"
  monitoring             = true
  vpc_security_group_ids = ["sg-039f4c24c1fda9695"]
  subnet_id              = "subnet-062d1488310b0856e"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}