# Input variables
variable "access_key" {}
variable "secret_key" {}

variable "region" {
  default = "us-east-1"
}

# NOTE: The region variable is optional because a default value is set

# Output variables
output "web_server_public_ip" {
  value = "${aws_instance.phpapp.public_ip}"
}

output "db_endpoint" {
  value = "${aws_db_instance.default.endpoint}"
}
