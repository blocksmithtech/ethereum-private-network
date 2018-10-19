# See https://www.terraform.io/docs/providers/aws/r/instance.html

resource "aws_instance" "ethereum-node" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_type}"

  tags {
    Name = "ethereum-node"
    env  = "ethereum-node-${var.env}"
  }

  key_name = "${var.key_name}"

  subnet_id = "${aws_subnet.public_a.id}"

  vpc_security_group_ids = [
    "${aws_security_group.ssh.id}",
    "${aws_security_group.http.id}",
    "${aws_security_group.geth_json_rpc.id}"
  ]

  associate_public_ip_address = true

  connection {
    user        = "ubuntu"
    private_key = "${file(var.key_pair_file)}"
  }

  provisioner "remote-exec" {
    scripts = [
      "./scripts/0.ethereum.bash",
      # "./scripts/9.others.bash",
    ]
  }
}

resource "aws_eip" "instance_ip" {
  instance = "${aws_instance.ethereum-node.id}"

  tags {
    env  = "ethereum-node-${var.env}"
  }
}

output "instance_ip" {
  value = "${aws_eip.instance_ip.public_ip}"
}
