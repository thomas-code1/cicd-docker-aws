resource "aws_key_pair" "ssh_key" {
  key_name   = "Web Server Key"
  public_key = file("~/.ssh/thomas_perso.pub")
}

# Security Group

resource "aws_security_group" "webserver_sg" {
  name        = "Web Server"
  description = "Web Server"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "Web Server"
  }
}

# Network Rules

resource "aws_security_group_rule" "ssh" {
  security_group_id = aws_security_group.webserver_sg.id

  description = "SSH"
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http" {
  security_group_id = aws_security_group.webserver_sg.id

  description = "HTTP"
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https" {
  security_group_id = aws_security_group.webserver_sg.id

  description = "HTTPS"
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

# Outbound Traffic Port Rule

resource "aws_security_group_rule" "all_outbound" {
  security_group_id = aws_security_group.webserver_sg.id

  description = "All outbound"
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
