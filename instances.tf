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
    "${aws_security_group.geth_discovery.id}",
    "${aws_security_group.geth_json_rpc.id}"
  ]

  associate_public_ip_address = true

  ebs_block_device {
    device_name           = "/dev/sdg"
    volume_type           = "gp2"
    volume_size           = 100 # update 1.geth-block-device.bash if changed
    delete_on_termination = true
    # snapshop_id           = ""
  }

  connection {
    user        = "ubuntu"
    private_key = "${file(var.key_pair_file)}"
  }

  provisioner "remote-exec" {
    scripts = [
      "./scripts/0.ethereum.bash",
      "./scripts/1.geth-block-device.bash",
      # "./scripts/9.others.bash",
    ]
  }

  provisioner "file" {
    source      = "./scripts/geth-start.bash"
    destination = "~/geth-start.bash"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/geth-start.bash",
      "screen -d -m ~/geth-start.bash",
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
