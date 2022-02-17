terraform {
  backend "local" {}
}

module "test0" {
  source = "../../../clustermongodb"

  name           = "mongodb-test0"
  engine         = "mongodb"
  engine_version = "4"
  node_count     = "3"
  region         = "nyc1"
  size           = "db-s-1vcpu-1gb"
  private_network_uuid = "c514286f-1bb0-4552-8a6d-bc5c43622619"

  firewall_rules = [
    {
      "type": "k8s"
      "value": "17fe4dc0-40c0-4d41-bb43-1727c0220a1d"
    }
  ]
}
