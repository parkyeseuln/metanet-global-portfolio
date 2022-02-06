resource "google_storage_bucket" "static-contents" {
  name          = var.static_bucket_name
  location      = "ASIA"
  force_destroy = true
}

resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.static-contents.name
  role   = "OWNER"
  entity = "user-dntwkzz79@gmail.com"
}


