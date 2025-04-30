provider "aws" {}

terraform {
  backend "s3" {
    bucket = "b59terraformstate2"
    key    = "that/state.tf"
    region = "us-east-1"
  }

}

provider "vault" {
  address         = "https://vault.eternallearnings.shop:8200/"
  skip_tls_verify = "true"

}