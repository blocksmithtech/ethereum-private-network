# See https://www.terraform.io/docs/providers/aws/r/security_group.html

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "Allow SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  vpc_id = "${aws_vpc.main.id}"

  tags {
    env = "ethereum-node-${var.env}"
  }
}

resource "aws_security_group" "http" {
  name        = "http-https"
  description = "Allow HTTP and HTTPS"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
    ipv6_cidr_blocks = [
      "::/0" # anywhere
    ]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
    ipv6_cidr_blocks = [
      "::/0" # anywhere
    ]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
    ipv6_cidr_blocks = [
      "::/0" # anywhere
    ]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
    ipv6_cidr_blocks = [
      "::/0" # anywhere
    ]
  }

  vpc_id = "${aws_vpc.main.id}"

  tags {
    env = "ethereum-node-${var.env}"
  }
}

resource "aws_security_group" "geth_http_rpc" {
  name        = "geth-http-rpc"
  description = "Allow JSON-RPC HTTP port for geth"

  ingress {
    from_port   = 8545
    to_port     = 8545
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  egress {
    from_port   = 8545
    to_port     = 8545
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  vpc_id = "${aws_vpc.main.id}"

  tags {
    env = "ethereum-node-${var.env}"
  }
}

resource "aws_security_group" "geth_ws_rpc" {
  name        = "geth-ws-rpc"
  description = "Allow JSON-RPC WebSocket port for geth"

  ingress {
    from_port   = 8546
    to_port     = 8546
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  egress {
    from_port   = 8546
    to_port     = 8546
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  vpc_id = "${aws_vpc.main.id}"

  tags {
    env = "ethereum-node-${var.env}"
  }
}


resource "aws_security_group" "geth_discovery" {
  name        = "geth-discovery"
  description = "Allow listening/discovery ports for geth"

  ingress {
    from_port   = 30303
    to_port     = 30303
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }
  ingress {
    from_port   = 30303
    to_port     = 30303
    protocol    = "udp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  egress {
    from_port   = 30303
    to_port     = 30303
    protocol    = "tcp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }
  egress {
    from_port   = 30303
    to_port     = 30303
    protocol    = "udp"
    cidr_blocks = [
      "0.0.0.0/0" # anywhere
    ]
  }

  vpc_id = "${aws_vpc.main.id}"

  tags {
    env = "ethereum-node-${var.env}"
  }
}
