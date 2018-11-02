# Declare the data source
data "aws_availability_zones" "available" {}

# Create a subnet to launch our web server instance into
resource "aws_subnet" "main" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "Web Server Public Subnet"
  }
}

# Create a subnet to launch our mysql server instance into, availability_zone specified to use more than 1 zone
resource "aws_subnet" "db_subnet_availability_zone1" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "DB Server Private Subnet AZ1"
  }
}

# Create a subnet to launch our mysql server instance into, availability_zone specified to use more than 1 zone
resource "aws_subnet" "db_subnet_availability_zone2" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags {
    Name = "DB Server Private Subnet AZ2"
  }
}