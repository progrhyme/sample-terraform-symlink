terraform {
  backend "s3" {
    bucket = "<bucket-name>"
    key    = "prod-infra.tfstate"
    region = "<region>"
  }
}
