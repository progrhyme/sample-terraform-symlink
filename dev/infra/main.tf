module "network" {
  source = "../../modules/network"

  project_env        = "${var.project_name}-${var.environment_name}"
  availability_zones = "${var.availability_zones}"
  vpc_main           = "${var.vpc_main}"
  subnets_main       = "${var.subnets_main}"
}

module "db" {
  source = "../../modules/db"

  project_env = "${var.project_name}-${var.environment_name}"
  db_main     = "${var.db_main}"
  network     = "${module.network.outputs}"
}
