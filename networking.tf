# See https://www.terraform.io/docs/providers/aws/r/vpc.html
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags {
    Name = "ethereum-node-${var.env}-vpc"
    env = "ethereum-node-${var.env}"
  }
}

# See https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "public_a" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.30.0/24"
  availability_zone = "${var.aws_subregion_a}"

  tags {
    env = "ethereum-node-${var.env}"
  }
}

# See https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    env = "ethereum-node-${var.env}"
  }
}

# See https://www.terraform.io/docs/providers/aws/r/route_table.html
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = "${aws_internet_gateway.main.id}"
  }

  tags {
    env = "ethereum-node-${var.env}"
  }
}

# See https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "public_a" {
  subnet_id      = "${aws_subnet.public_a.id}"
  route_table_id = "${aws_route_table.main.id}"
}
