# 应用的服务端口
variable "service_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

# ssh秘钥对名称
variable "old_keypair" {
  description = "Use you old key pair to access this instance via ssh"
  default     = "test-tokyo"
}

variable "chef_provision" {
  type        = "map"
  description = "Configuration details for chef server"

  default = {
    server_url      = "https://api.chef.io/organizations/org"
    user_name       = "martinliu"
    user_key_path   = "~/chef-repo/.chef/martinliu.pem"
    recreate_client = true
  }
}

variable "connection_thingys" {
  type        = "map"
  description = "Configuration details for connecting to the remote machine"

  default = {
    # Default to SSH
    connection_type = "ssh"

    # User to connect to the server
    connection_user = "centos"

    # Password to connect to the server
    connection_password = "admini"
  }
}
