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
