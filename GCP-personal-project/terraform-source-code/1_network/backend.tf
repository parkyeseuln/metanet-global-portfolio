terraform {
  backend "gcs" {
    bucket = "bts-terraform"
    prefix = "database/state"
  }
}