terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
provider "aws" {
  region = "us-west-2"
}

resource "random_id" "my-random-id" {
  byte_length = 2
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "s3devika"
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true

    transition {
      storage_class = "STANDARD_IA"
      days          = 30
    }
  }

  tags = {
    Name = "21-days-of-aws-using-terraform"
  }
}