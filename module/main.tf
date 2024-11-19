module "ec2_instance" {
  source             = "terraform-aws-modules/ec2_instance/aws"
  name               = "single-instance"
  instance_type      = "t2.micro"
  key_name           = "Elcy_rsa"
  monitoring         = true
  vpc_security_group_ids = ["sg-0d18d3771dc781bc4"]
  subnet_id          = "subnet-0c5c6262e0aa26910"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}