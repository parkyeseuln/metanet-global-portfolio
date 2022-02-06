terraform {
  backend "gcs" {
    bucket = "bts-terraform"
    prefix = "iam/state"
  }
}