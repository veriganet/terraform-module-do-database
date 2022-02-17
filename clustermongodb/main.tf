# ########
# Provider
# ########

# Configure the DigitalOcean Provider
provider "digitalocean" {}

# #########
# terraform
# #########

# rest of the backend part will be filled by terragrunt
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  backend "s3" {}
}

########
# LOCALS
########



######
# DATA
######


###########
# RESOURCES
###########

resource "digitalocean_database_cluster" "this" {
  name = var.name
  engine = var.engine
  version = var.engine_version
  size = var.size
  region = var.region
  node_count = var.node_count
  tags = var.tags
  private_network_uuid = var.private_network_uuid
  maintenance_window {
    day  = var.maintenance_window_day
    hour = var.maintenance_window_hour
  }
}

resource "digitalocean_database_firewall" "this" {
  cluster_id = digitalocean_database_cluster.this.id

  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      type  = rule.value["type"]
      value = rule.value["value"]
    }
  }
}
