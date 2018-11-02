resource "aws_instance" "phpapp" {
  ami           = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"

  #   associate_public_ip_address = "true"
  subnet_id              = "${aws_subnet.main.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_web_traffic.id}"]

  tags {
    Name = "Web Server"
  }

  user_data = <<HEREDOC
#!/bin/bash -ex
yum -y update
yum -y install httpd php mysql php-mysql
chkconfig httpd on
service httpd start
cd /var/www/html
wget https://s3-us-west-2.amazonaws.com/us-west-2-aws-training/awsu-spl/spl-13/scripts/app.tgz
tar xvfz app.tgz
chown apache:root /var/www/html/rds.conf.php
HEREDOC
}
