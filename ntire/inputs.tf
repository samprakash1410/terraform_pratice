variable "region" {
  type        = string
  default     = "us-east-1"
  description = "region in which resource will be created"

}

variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "subnetcount" {
  type    = number
  default = 3
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24"]
}

variable "web_cidr" {
  type    = string
  default = "10.100.0.0/24"
}

variable "business_cidr" {
  type    = string
  default = "10.100.1.0/24"
}

variable "data_cidr" {
  type    = string
  default = "10.100.2.0/24"
}

