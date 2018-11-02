# Declare the data source
data "aws_availability_zones" "available" {}

resource "aws_subnet" "main" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "Web Server Public Subnet"
  }
}

resource "aws_subnet" "db_subnet_availability_zone1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "DB Server Private Subnet AZ1"
  }
}

resource "aws_subnet" "db_subnet_availability_zone2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "DB Server Private Subnet AZ2"
  }
}