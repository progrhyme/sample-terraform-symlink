# Security Group
resource "aws_security_group" "ssh_restricted" {
  name   = "ssh-restricted"
  vpc_id = "${var.network["vpc_main_id"]}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.trusted_cidr_blocks}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instance
resource "aws_instance" "bastion" {
  ami           = "${var.compute_bastion["ami_id"]}"
  instance_type = "${var.compute_bastion["instance_type"]}"
  key_name      = "${var.ec2_ssh_key_name}"
  subnet_id     = "${var.network["subnet_main_public1"]}"

  vpc_security_group_ids = [
    "${var.network["security_group_main_default"]}",
    "${aws_security_group.ssh_restricted.id}",
  ]

  root_block_device {
    volume_type = "${var.compute_bastion["volume_type"]}"
    volume_size = "${var.compute_bastion["volume_size"]}"
  }

  tags {
    Name = "bastion"
    Role = "bastion"
  }
}

# EIP
resource "aws_eip" {
  instance = "${aws_instance.bastion.id}"
  vpc      = true
}
