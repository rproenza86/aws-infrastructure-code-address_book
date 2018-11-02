resource "aws_db_subnet_group" "default" {
  name       = "mysql subnet group"
  subnet_ids = ["${aws_subnet.db_subnet_availability_zone1.id}", "${aws_subnet.db_subnet_availability_zone2.id}"]

  tags {
    Name = "DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage       = 10
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "db.t2.micro"
  name                    = "mydb"
  username                = "admin"
  password                = "adminpassword"
  parameter_group_name    = "default.mysql5.7"
  backup_retention_period = 0
  db_subnet_group_name    = "${aws_db_subnet_group.default.id}"
  vpc_security_group_ids  = ["${aws_security_group.allow_db_traffic.id}"]
}
