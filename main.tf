terraform {
#  backend "remote" {
#    hostname = "app.terraform.io"
#    organization = "ArtistUniverse"#
#    workspaces {
#      name = "terra-house"
#    }
#  }

  cloud {
    organization = "ArtistUniverse"

    workspaces {
      name = "terra-house"
    }
  }
  
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }

     aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  length           = 32
  special          = false
  lower            = true
  upper            = false
}

# Creating a S3 bucket and getting the output name and placing it as the value.
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
