# DB Subnet Group
resource "aws_db_subnet_group" "default" {
  name       = "${var.project_env}-default"
  subnet_ids = ["${var.network["subnet_main_private1"]}", "${var.network["subnet_main_private2"]}"]

  tags {
    Name = "${var.project_env}-default"
  }
}

# Security Group
resource "aws_security_group" "db_default" {
  name        = "db-default"
  vpc_id      = "${var.network["vpc_main_id"]}"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_main["cidr"]}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# DB Parameter Group
resource "aws_db_parameter_group" "main" {
  name   = "${var.project_env}-main"
  family = "${var.db_main["family"]}"
}

# DB Instance
resource "aws_db_instance" "main" {
  engine                 = "${var.db_main["engine"]}"
  engine_version         = "${var.db_main["engine_version"]}"
  instance_class         = "${var.db_main["instance_class"]}"
  storage_type           = "${var.db_main["storage_type"]}"
  allocated_storage      = "${var.db_main["allocated_storage"]}"
  name                   = "${var.db_main["name"]}"
  username               = "${var.db_main["username"]}"
  password               = "${var.db_main["password"]}"
  db_subnet_group_name   = "${aws_db_subnet_group.default.name}"
  vpc_security_group_ids = ["${aws_security_group.db_default.id}"]
  parameter_group_name   = "${aws_db_parameter_group.main.name}"
}
