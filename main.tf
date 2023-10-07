terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
    
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ArtistUniverse"#

  #  workspaces {
  #    name = "terra-house"
  #  }
  #}

  cloud {
    organization = "ArtistUniverse"

    workspaces {
      name = "terra-house"
    }
  }
  
  #required_providers {
  #  random = {
  #    source = "hashicorp/random"
  #    version = "3.5.1"
  #  }

#provider "random" {
#  # Configuration options
}
provider "terratowns" {
  endpoint = var.terratowns_endpoint 
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Baldur's Gate 3: A Life Changing Masterpiece!"
  description = <<DESCRIPTION
In the heart of the Forgotten Realms, where swords clash and magic reigns, lies a tale of epic adventure.

Baldur's Gate 3 is a Dungeons & Dragons RPG set in a world where anything is possible.

You are a Tav'ern, a mortal vessel for an otherworldly parasite. Implanted with a Mindflayer tadpole, you must find a way to remove it before it takes control of your mind.

Along the way, you'll gather a party of companions, each with their own unique skills and abilities. Together, you'll explore the Sword Coast, battle fearsome creatures, and uncover hidden secrets.

But beware, the Mindflayer tadpole is not the only danger that awaits you. The world is in turmoil, and dark forces are at work.

Can you save yourself and the world from the Mindflayer threat?

Only you can decide.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdq3gz.cloudfront.net"
  town = "missingo"
  content_version = 1
}