terraform {
  backend "gcs" {
    bucket = "bts-terraform"
    prefix = "storage/state"
  }
}