output "outputs" {
  value = "${map(
    "vpc_main_id", "${aws_vpc.main.id}",
    "security_group_main_default", "${aws_vpc.main.default_security_group_id}",
    "subnet_main_public1", "${aws_subnet.main_public.0.id}",
    "subnet_main_public2", "${aws_subnet.main_public.1.id}",
    "subnet_main_private1", "${aws_subnet.main_private.0.id}",
    "subnet_main_private2", "${aws_subnet.main_private.1.id}",
  )}"
}
