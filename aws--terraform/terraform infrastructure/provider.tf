terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ""
    }
  }
}

provider "aws" {
  #configuration of region
  region = "us-east-1"
}