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
#
  #   aws = {
  #    source = "hashicorp/aws"
  #    version = "5.17.0"
  #  }
  #}
}

provider "aws" {
  # Configuration options
}

#provider "random" {
#  # Configuration options
#}