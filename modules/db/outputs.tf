output "outputs" {
  value = "${map(
    "main_endpoint", "${aws_db_instance.main.endpoint}",
    "main_port",     "${aws_db_instance.main.port}",
    "main_database", "${aws_db_instance.main.name}",
    "main_username", "${aws_db_instance.main.username}",
  )}"
}
