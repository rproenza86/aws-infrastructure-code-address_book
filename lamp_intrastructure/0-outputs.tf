# Output variables
output "web_server_public_ip" {
  value = "${aws_instance.phpapp.public_ip}"
}

output "db_endpoint" {
  value = "${aws_db_instance.default.endpoint}"
}
