resource "aws_ebs_volume" "ethereum-data" {
  availability_zone = "${var.aws_subregion_a}"

  type      = "standard"
  size      = "10"
  encrypted = false

  lifecycle {
    # waiting for https://github.com/hashicorp/terraform/issues/3116
    # prevent_destroy = "${var.ethereum_data_prevent_destroy}"
    # for now do this manually
    prevent_destroy = false
  }

  tags {
    env  = "ethereum-node-${var.env}"
  }
}

resource "aws_volume_attachment" "ethereum-data-attch" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.ethereum-data.id}"
  instance_id = "${aws_instance.ethereum-node.id}"
}

# TODO: mount the volume after attachment / EC2 instance launches
# http://www.sanjeevnandam.com/blog/ec2-mount-ebs-volume-during-launch-time
# ensure it stays mounted after reboots

output "ethereum-data-vol-id" {
  value = "${aws_ebs_volume.ethereum-data.id}"
}
