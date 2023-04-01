variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "ec2_size" {
  description = "EC2 size"
  type        = string
  default     = "t2.micro"
}

variable "server_name" {
  description = "List of app servers"
  type        = list(string)
  default     = ["Prod", "Test"]
}
