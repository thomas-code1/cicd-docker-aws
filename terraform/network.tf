data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "web_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
