terraform {
  backend "s3" {
     bucket         	   = "b59terraformstate2"
    key              	   = "dev/state.tf"
    region         	   = "us-east-1"
  }

}