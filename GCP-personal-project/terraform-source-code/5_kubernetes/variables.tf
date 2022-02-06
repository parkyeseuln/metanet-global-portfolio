variable "gke_cluster" {
  type        = string
  default     = "bts-cluster"
  description = "gke username"
}

variable "gke_username" {
  type        = string
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  type        = string
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  type        = string
  default     = 1
  description = "number of gke nodes"
}

variable "master_ipv4_cidr_block" {
  type        = string
  default     = "10.2.0.0/28"
  description = ""
}

variable "ip_range_pods" {
  type        = string
  default     = "172.16.0.0/20"
  description = "The secondary ip range to use for pods"
}

variable "ip_range_cluster" {
  type        = string
  default     = "10.28.0.0/14"
  description = "The secondary ip range to use for clusters"
}

variable "ip_range_services" {
  type        = string
  default     = "10.32.0.0/20"
  description = "The secondary ip range to use for services"
}

variable "kuber_sa" {
  type        = string
  default     = "kuber-admin"
  description = "vm-ser-acc@hybrid-bts.iam.gserviceaccount.com"
}
variable "key_name" {
  type        = string
  default     = "projects/hybrid-bts/serviceAccounts/vm-ser-acc@hybrid-bts.iam.gserviceaccount.com/keys/97203600b2164d524aea9f69996a6d6ad8edb624"
  description = ""
}
variable "global_ip_name" {
  type        = string
  default     = "bts-global-ingress"
  description = ""
}

variable "cluster_autoscaling" {
  type = object({
    enabled       = bool
    min_cpu_cores = number
    max_cpu_cores = number
    min_memory_gb = number
    max_memory_gb = number
    gpu_resources = list(object({ resource_type = string, minimum = number, maximum = number }))
  })
  default = {
    enabled       = false
    max_cpu_cores = 0
    min_cpu_cores = 0
    max_memory_gb = 0
    min_memory_gb = 0
    gpu_resources = []
  }
  description = ""
}

variable "enable_private_nodes" {
  type        = bool
  description = "(Beta) Whether nodes have internal IP addresses only"
  default     = true
}

variable "enable_private_endpoint" {
  type        = bool
  description = "(Beta) Whether the master's internal IP address is used as the cluster endpoint"
  default     = false
}

variable "master_global_access_enabled" {
  type        = bool
  description = "(Beta) Whether the cluster master is accessible globally (from any region) or only within the same region as the private endpoint."

  default = true
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

variable "priv_sub_2" {
  type        = string
  description = ""
  default = "bts-priv-sub-2"
}

variable "priv_sub_1" {
  type        = string
  description = ""
  default = "bts-priv-sub-1"
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


