
resource "google_service_account" "kuber" {
  account_id   = var.sa_id
  display_name = var.sa_id
}

resource "google_service_account_key" "kuberkey" {
  service_account_id = google_service_account.kuber.id
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_project_iam_member" "kuber" {
  count   = 1
  project = var.project_id
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.kuber.email}"
}
