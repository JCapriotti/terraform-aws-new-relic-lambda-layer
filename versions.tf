terraform {
  required_version = ">= 0.13.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.23"
    }
    http = {
      source = "hashicorp/http"
      version = ">= 3.0.1"
    }
  }
}
