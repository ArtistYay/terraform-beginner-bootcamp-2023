#resource "random_string" "bucket_name" {
#  length           = 32
#  special          = false
#  lower            = true
#  upper            = false
#}

# Creating a S3 bucket and getting the name from a variable.
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}