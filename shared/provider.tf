provider "aws" {
  version = "~> 1.0"
  profile = "${aws_profile}"
  region  = "${aws_region}"
}
