# VPC
resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_main["cidr"]}"

  tags {
    Name = "${var.project_env}-main"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_env}-main"
  }
}

# Subnets
resource "aws_subnet" "main_public" {
  count = "${length(var.subnets_main["public"])}"

  cidr_block        = "${element(var.subnets_main["public"], count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags {
    Name = "${var.project_env}-main-public${count.index + 1}"
  }
}

resource "aws_subnet" "main_private" {
  count = "${length(var.subnets_main["private"])}"

  cidr_block        = "${element(var.subnets_main["private"], count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"

  tags {
    Name = "${var.project_env}-main-private${count.index + 1}"
  }
}

# Route Tables
resource "aws_route_table" "main_public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags {
    Name = "${var.project_env}-main-public"
  }
}

resource "aws_route_table" "main_private" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.project_env}-main-private"
  }
}

resource "aws_route_table_association" "main_public" {
  count          = "${length(var.subnets_main["public"])}"
  subnet_id      = "${element(aws_subnet.main_public.*.id, count.index)}"
  route_table_id = "${aws_route_table.main_public.id}"
}

resource "aws_route_table_association" "main_private" {
  count          = "${length(var.subnets_main["private"])}"
  subnet_id      = "${element(aws_subnet.main_private.*.id, count.index)}"
  route_table_id = "${aws_route_table.main_private.id}"
}
