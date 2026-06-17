terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
  }
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"
}