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

# Creating an S3 bucket and getting the name from a variable.
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = var.index_html_filepath # "${path.root}/public/index.html"

  etag = filemd5(var.index_html_filepath)
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = var.error_html_filepath 

  etag = filemd5(var.error_html_filepath)
}