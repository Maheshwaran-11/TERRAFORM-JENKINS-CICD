terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

# Additional provider for us-east-1 region
provider "aws" {
  alias  = "useast1"
  region = "us-east-1"
}