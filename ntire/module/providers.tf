terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.76.0"
    }
  }
  //requried_version=">1.6.0"
}


provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
        Env = "Dev"
        createdBy = "terraform"
    }
  }
}