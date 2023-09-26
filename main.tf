terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ArtistUniverse"#

  #  workspaces {
  #    name = "terra-house"
  #  }
  #}

 # cloud {
 #   organization = "ArtistUniverse"
#
 #   workspaces {
 #     name = "terra-house"
 #   }
 # }
  
  #required_providers {
  #  random = {
  #    source = "hashicorp/random"
  #    version = "3.5.1"
  #  }

#provider "random" {
#  # Configuration options
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}