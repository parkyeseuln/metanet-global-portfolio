#data resources
data "google_compute_network" "vpc_network" {
  project = var.project_id
  name    = var.network_name
}

data "google_compute_subnetwork" "subnets" {
  name   = var.pub_sub_1
  region = var.region
}

#bastion vm
resource "google_compute_instance" "vm_instance" {
  name                    = "bts-bastion-vm"
  zone                    = "asia-northeast3-a"
  metadata_startup_script = file("startup.sh")
  machine_type            = "f1-micro"
  tags                    = ["bastion"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network    = data.google_compute_network.vpc_network.name
    subnetwork = data.google_compute_subnetwork.subnets.name
  }

  service_account {
    email  = "vm-ser-acc@hybrid-bts.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
