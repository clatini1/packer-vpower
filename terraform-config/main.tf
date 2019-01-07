# Specify the provider and access details
# provider "aws" {
#   region = "${var.aws_region}"
# }

data "aws_ami" "aws_ami_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["packer*"]
  }
}

resource "aws_instance" "ec2-core-packer" {
  ami           = "${data.aws_ami.aws_ami_image.id}"
  instance_type = "t2.small"

  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
    delete_on_termination = "false"
    # encrypted = "true"
  }

  tags {
    Name      = "packer-terraform-test"
    config_mgmt = "terraform"
    ebs-snapshot = "true"
    aws_type  = "ec2"
  }
}

