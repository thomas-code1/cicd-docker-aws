data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "app" {
  count         = length(var.server_name)
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.ec2_size
  subnet_id     = data.aws_subnets.web_subnet.ids[0] # provision the ec2 in the first subnet available
  key_name      = aws_key_pair.ssh_key.key_name

  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.webserver_sg.id]

  tags = {
    Name = "${var.server_name[count.index]} Server"
  }
}

resource "local_file" "ansible_hosts" {
  content = templatefile("./modules/templates/hosts.tpl",
    {
      public_ip = aws_instance.app.*.public_ip
    }
  )
  filename = "../ansible/hosts"
}
