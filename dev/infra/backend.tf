terraform {
  backend "s3" {
    bucket = "<bucket-name>"
    key    = "dev-infra.tfstate"
    region = "<region>"
  }
}
