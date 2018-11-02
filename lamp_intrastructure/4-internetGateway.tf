# Create an internet gateway to give our public web server subnet access to the outside world
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "Web Server VPC IG"
  }
}
