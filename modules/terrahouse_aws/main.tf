terraform {
    required_providers {
      aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
    } 
  }

#provider "aws" {
#  # Configuration options
#}

#resource "random_string" "bucket_name" {
#  length           = 32
#  special          = false
#  lower            = true
#  upper            = false
#}

data "aws_caller_identity" "current" {}