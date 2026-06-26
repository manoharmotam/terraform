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
  backend "s3" {
    key          = "terraform_data/terraform_data-demo.tfstate"
    bucket       = "manoharmotam-terraform-state"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true

  }
}

provider "aws" {
  region = "us-east-1"
}