variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "bucketname" {
  type    = string
  default = "ritvikbucket2025"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}

