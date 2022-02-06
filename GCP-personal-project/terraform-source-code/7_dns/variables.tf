variable "ingress_ip" {
  type        = string
  default     = "bts-ingress"
  description = ""
}

variable "dns_zone" {
  type        = string
  default     = "hybrid"
  description = ""
}

variable "dns_name" {
  type        = string
  default     = "hybridbts.net."
  description = ""
}

