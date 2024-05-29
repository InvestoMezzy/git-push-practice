
resource "google_storage_bucket" "mezztf1" {
  name          = "bigmezzy_tfbucket_from_terraform"
  location      = "US-CENTRAL1"
  force_destroy = true
  uniform_bucket_level_access = true

  labels = {
    "env" = "class"
    "dep" = "armageddon"
}

website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
}
}
resource "google_storage_bucket_object" "html" {
  name   = "html script"
  bucket = google_storage_bucket.mezztf1.name
  source = "index.html"
}

resource "google_storage_bucket_object" "photo" {
  name   = "beach"
  bucket = google_storage_bucket.mezztf1.name
  source = "beach.jpg"
}

resource "google_storage_bucket_object" "photo1" {
  name   = "coffee"
  bucket = google_storage_bucket.mezztf1.name
  source = "coffee.jpg"
}
 output "publiclink" {
  value = google_storage_bucket.mezztf1.id

 }


