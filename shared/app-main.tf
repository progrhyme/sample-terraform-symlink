module "compute" {
  source = "../../modules/compute"

  compute_bastion  = "${var.compute_bastion}"
  ec2_ssh_key_name = "${var.ec2_ssh_key_name}"

  network = "${data.terraform_remote_state.infra.network}"
}
