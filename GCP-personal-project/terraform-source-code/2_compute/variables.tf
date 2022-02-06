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

variable "pub_sub_1" {
  type        = string
  description = ""
  default = "bts-priv-sub-2"
}

variable "priv_sub_1" {
  type        = string
  description = ""
  default = "bts-priv-sub-1"
}
