terraform {
  required_version = ">= 0.8, < 0.11.4"
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "docker" {
  ami                    = "ami-25bd2743"
  instance_type          = "t2.medium"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  key_name               = "${var.old_keypair}"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              EOF

  tags {
    Name = "terraform-docker"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-docker-instance"

  ingress {
    from_port   = "${var.service_port}"
    to_port     = "${var.service_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
