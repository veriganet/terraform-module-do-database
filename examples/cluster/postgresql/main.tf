terraform {
  backend "local" {}
}

module "test0" {
  source = "../../../clusterpg"

  name           = "postgresql-test0"
  engine         = "pg"
  engine_version = "13"
  node_count     = "2"
  region         = "nyc1"
  size           = "db-s-1vcpu-2gb"
  private_network_uuid = "c514286f-1bb0-4552-8a6d-bc5c43622619"

  firewall_rules = [
    {
      "type": "k8s"
      "value": "17fe4dc0-40c0-4d41-bb43-1727c0220a1d"
    },
    {
      "type": "ip_addr"
      "value": "10.138.0.0/16"
    }
  ]

  pools = {
    defaultdb = {
      "mode" = "transaction",
      "size" = "20",
      "db_name" = "defaultdb",
      "user" = "doadmin"
    }
  }
}
