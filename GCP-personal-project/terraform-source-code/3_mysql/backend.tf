terraform {
  backend "gcs" {
    bucket = "bts-terraform"
    prefix = "mysql/state"
  }
}
