locals {
  ip_configuration_enabled = length(keys(var.ip_configuration)) > 0 ? true : false

  ip_configurations = {
    enabled  = var.ip_configuration
    disabled = {}
  }
}

#sql instance
resource "google_sql_database_instance" "instance" {
  provider            = google-beta
  name                = var.sql_instance_name
  database_version    = var.database_version
  
  settings {
    tier = "db-f1-micro"

    dynamic "ip_configuration" {
      for_each = [local.ip_configurations[local.ip_configuration_enabled ? "enabled" : "disabled"]]
      content {
        ipv4_enabled    = lookup(ip_configuration.value, "ipv4_enabled", null)
        private_network = lookup(ip_configuration.value, "private_network", null)
        require_ssl     = lookup(ip_configuration.value, "require_ssl", null)

        dynamic "authorized_networks" {
          for_each = lookup(ip_configuration.value, "authorized_networks", [])
          content {
            expiration_time = lookup(authorized_networks.value, "expiration_time", null)
            name            = lookup(authorized_networks.value, "name", null)
            value           = lookup(authorized_networks.value, "value", null)
          }
        }
      }
    }
  }
}

resource "google_sql_user" "default" {
  count      = var.enable_default_user ? 1 : 0
  project    = var.project_id
  name       = var.db_user_name
  instance   = google_sql_database_instance.instance.name
  password   = var.db_user_password
}
