variable "service_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

variable "old_keypair" {
  description = "Use you old key pair to access this instance via ssh"
  default     = "test-tokyo"
}

variable "list_example" {
  description = "An example of a list in Terraform"
  type        = "list"
  default     = [1, 2, 3]
}

variable "map_example" {
  description = "An example of a map in Terraform"
  type        = "map"

  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}
