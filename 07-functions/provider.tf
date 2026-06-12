terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.9.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.48.0"
    }
  }
}