variable "name" {
  description = "(Required) A name for the Kubernetes cluster."
  type = string
}

variable "engine" {
  description = "(Required) Database engine used by the cluster (ex. pg for PostreSQL, mysql for MySQL, redis for Redis, or mongodb for MongoDB)."
  type = string
}

variable "size" {
  description = "(Required) Database Droplet size associated with the cluster (ex. db-s-1vcpu-1gb). See here for a list of valid size slugs: https://docs.digitalocean.com/reference/api/api-reference/#tag/Databases"
  type = string
}

variable "region" {
  description = "(Required) DigitalOcean region where the cluster will reside."
  type = string
}

variable "node_count" {
  description = "(Required) Number of nodes that will be included in the cluster."
  type = string
}

variable "engine_version" {
  description = "(Required) Engine version used by the cluster (ex. 11 for PostgreSQL 11)."
  type = string
}

variable "tags" {
  description = "(Optional) A list of tag names to be applied to the database cluster."
  type = list(string)
  default = []
}

variable "private_network_uuid" {
  description = "(Optional) The ID of the VPC where the database cluster will be located."
  type = string
  default = ""
}

variable "eviction_policy" {
  description = "(Optional) A string specifying the eviction policy for a Redis cluster. Valid values are: noeviction, allkeys_lru, allkeys_random, volatile_lru, volatile_random, or volatile_ttl."
  type = string
  default = "NA"
}

variable "sql_mode" {
  description = "(Optional) A comma separated string specifying the SQL modes for a MySQL cluster."
  type = string
  default = ""
}

variable "maintenance_window_day" {
  description = "(Required) The day of the week on which to apply maintenance updates."
  type = string
  default = "monday"
}

variable "maintenance_window_hour" {
  description = "(Required) The hour in UTC at which maintenance updates will be applied in 24 hour format."
  type = string
  default = "03:30:00"
}

variable "firewall_rules" {
  description = "A rule specifying a resource allowed to access the database cluster. For more info: https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/database_firewall"
  type = list(map(string))
  default = []
}

variable "pools" {
  # name; (Required) The name for the database connection pool.
  # mode; (Required) The PGBouncer transaction mode for the connection pool. The allowed values are session, transaction, and statement.
  # size; (Required) The desired size of the PGBouncer connection pool.
  # db_name; (Required) The database for use with the connection pool.
  # user; (Required) The name of the database user for use with the connection pool.
  description = "Provides a DigitalOcean database connection pool resource."
  type = map
  default = {}
}
