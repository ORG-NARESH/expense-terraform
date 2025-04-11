terraform {
backend "s3" {
    bucket         	   = "b59-terraformstate"
    key              	   = "dev/backendstate.tf"
    region         	   = "us-east-1"
    
  }
}