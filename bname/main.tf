provider "aws" {
    region = "us-east-1"
  
} 
variable "bname" {
  type = string 
}
resource "aws_s3_bucket" "test" {
  bucket = var.bname
}