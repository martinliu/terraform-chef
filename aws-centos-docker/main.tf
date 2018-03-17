terraform {
  required_version = ">= 0.8, < 0.11.4"
}

# 使用 AWS  Tokyo
provider "aws" {
  region = "ap-northeast-1"
}

# ec2 实例
resource "aws_instance" "docker" {
  # centos 7 的 ami 镜像
  ami           = "ami-25bd2743"
  instance_type = "t2.medium"

  # 使用下面所创建的 sg
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  # 使用已有的 keypair
  key_name = "${var.old_keypair}"

  # 创建自定义数据
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
            EOF

  # 打标签
  tags {
    Name = "terraform-docker"
  }

  provisioner "chef" {
    server_url      = "${var.chef_provision.["server_url"]}"
    user_name       = "${var.chef_provision.["user_name"]}"
    user_key        = "${file("${var.chef_provision.["user_key_path"]}")}"
    node_name       = "my-docker-host"
    run_list        = ["recipe[workstation],recipe[mydocker]"]
    recreate_client = "${var.chef_provision.["recreate_client"]}"
    on_failure      = "continue"

    attributes_json = <<-EOF
      {
        "tags": [
          "my-docker-host"
        ]
      }
    EOF

    connection {
      type        = "ssh"
      user        = "centos"
      private_key = "~/test-tokyo.pem"
    }
  }
}

# 创建 sg
resource "aws_security_group" "instance" {
  name = "terraform-docker-instance"

  # 入栈规则
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

  # 出栈规则
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
