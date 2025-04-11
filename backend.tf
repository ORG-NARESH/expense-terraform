terraform {
  backend "s3" {
     bucket         	   = "b59terraformstate2"
    key              	   = "${var.env}/state.tf"
    region         	   = "us-east-1"
  }

}