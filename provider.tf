provider "aws" {}

terraform {
  backend "s3" {
    bucket = "b59terraformstate2"
    key    = "that/state.tf"
    region = "us-east-1"
  }

}