
variable "sql_instance_name" {
  type        = string
  description = ""
  default = "bts-sql-3"
}

variable "database_version" {
  type        = string
  description = ""
  default = "MYSQL_5_7"
}

variable "sql_db_name" {
  type        = string
  description = ""
  default = "bts-1"
}

variable "enable_default_user" {
  description = ""
  type        = bool
  default     = true
}

variable "ip_configuration" {
  description = "The ip_configuration settings subblock"
  type = object({
    authorized_networks = list(map(string))
    ipv4_enabled        = bool
    private_network     = string
    require_ssl         = bool
  })
  default = {
    authorized_networks = []
    ipv4_enabled        = true
    private_network     = null
    require_ssl         = null
  }
}


// Master
variable "tier" {
  description = "The tier for the master instance."
  type        = string
  default     = "db-n1-standard-1"
}

variable "activation_policy" {
  description = "The activation policy for the master instance. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`."
  type        = string
  default     = "ALWAYS"
}

variable "availability_type" {
  description = "The availability type for the master instance. Can be either `REGIONAL` or `null`."
  type        = string
  default     = "REGIONAL"
}

variable "disk_autoresize" {
  description = "Configuration to increase storage size"
  type        = bool
  default     = true
}

variable "disk_size" {
  description = "The disk size for the master instance"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "The disk type for the master instance."
  type        = string
  default     = "PD_SSD"
}

variable "pricing_plan" {
  description = "The pricing plan for the master instance."
  type        = string
  default     = "PER_USE"
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  type        = number
  default     = 1
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  type        = number
  default     = 23
}

variable "maintenance_window_update_track" {
  description = "The update track of maintenance window for the master instance maintenance. Can be either `canary` or `stable`."
  type        = string
  default     = "canary"
}

variable "database_flags" {
  description = "List of Cloud SQL flags that are applied to the database server. See [more details](https://cloud.google.com/sql/docs/mysql/flags)"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}


variable "user_labels" {
  type        = map(string)
  default     = {}
  description = "The key/value labels for the master instances."
}

variable "read_replicas" {
  description = "List of read replicas to create. Encryption key is required for replica in different region. For replica in same region as master set encryption_key_name = null"
  type = list(object({
    name            = string
    tier            = string
    zone            = string
    disk_type       = string
    disk_autoresize = bool
    disk_size       = string
    user_labels     = map(string)
    database_flags = list(object({
      name  = string
      value = string
    }))
    ip_configuration = object({
      authorized_networks = list(map(string))
      ipv4_enabled        = bool
      private_network     = string
      require_ssl         = bool
    })
    encryption_key_name = string
  }))
  default = []
}

variable "read_replica_name_suffix" {
  description = "The optional suffix to add to the read instance name"
  type        = string
  default     = "rr"
}
variable "read_replica_deletion_protection" {
  description = "Used to block Terraform from deleting replica SQL Instances."
  type        = bool
  default     = false
}

variable "create_timeout" {
  description = "The optional timout that is applied to limit long database creates."
  type        = string
  default     = "10m"
}

variable "update_timeout" {
  description = "The optional timout that is applied to limit long database updates."
  type        = string
  default     = "10m"
}

variable "delete_timeout" {
  description = "The optional timout that is applied to limit long database deletes."
  type        = string
  default     = "10m"
}

variable "db_user_name" {
  type        = string
  description = ""
  default = "admin"
}

variable "db_user_password" {
  type        = string
  description = ""
  default = "admin123"
}


variable "project_id" {
  type        = string
  default     = "hybrid-bts"
}

variable "network_name" {
  type        = string
  description = ""
  default = "bts-vpc"
}
variable "region" {
  type        = string
  description = ""
  default = "asia-northeast3"
}

variable "zone" {
  type        = string
  description = ""
  default = "asia-northeast3-a"
}

variable "priv_sub_1" {
  type        = string
  description = ""
  default = "bts-priv-sub-1"
}

variable "priv_sub_2" {
  type        = string
  description = ""
  default = "bts-priv-sub-2"
}

variable "cidr" {
  type        = string
  description = ""
  default = "10.0.0.0/16"
}

variable "priv_1_cidr" {
  type        = string
  description = ""
  default = "10.0.2.0/24"
}

variable "priv_2_cidr" {
  type        = string
  description = ""
  default = "10.0.3.0/24"
}

variable "state_bucket_name" {
  type        = string
  description = ""
  default = "bts-terraform"
}
