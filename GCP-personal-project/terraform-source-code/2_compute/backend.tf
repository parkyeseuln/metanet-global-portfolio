terraform {
  backend "gcs" {
    bucket = "bts-terraform"
    prefix = "kubernetes/state"
  }
}