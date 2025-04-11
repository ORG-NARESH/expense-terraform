terraform {
backend "s3" {
    bucket         	   = "b59-terraformstate"
    key              	   = "dev/state.tf"
    region         	   = "us-east-1"
    
  }
}