terraform {
backend "s3" {
    bucket         	   = "b59-terraformstate"
    key              	   = "prod/state.tf"
    region         	   = "us-east-1"
    
  }
}