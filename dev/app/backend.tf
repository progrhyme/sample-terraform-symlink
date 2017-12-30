terraform {
  backend "s3" {
    bucket = "<backet name>"
    key    = "dev-app.tfstate"
    region = "<region>"
  }
}

data "terraform_remote_state" "infra" {
  backend = "s3"

  config {
    bucket = "<backet name>"
    key    = "dev-infra.tfstate"
    region = "<region>"
  }
}
