provider "google" {

  credentials = file("/Users/princess/megazone_portfolio/GCP_personal_project/terraform_source_code/gcp-bts-terraform/credentials.json")
  project = var.project_id
  region  = var.region
}
