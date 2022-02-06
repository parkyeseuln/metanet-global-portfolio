data "google_compute_network" "vpc_network" {
  project = var.project_id
  name    = var.network_name
}

data "google_compute_subnetwork" "subnets" {
  name    = var.priv_sub_1
  project = var.project_id
  region  = var.region
}

# GKE cluster
resource "google_container_cluster" "cluster" {
  name         = var.gke_cluster
  project      = var.project_id
  location     = var.region
  network      = data.google_compute_network.vpc_network.name
  subnetwork   = data.google_compute_subnetwork.subnets.name

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.ip_range_cluster
    services_ipv4_cidr_block = var.ip_range_services
  }

  remove_default_node_pool = true
  initial_node_count       = 1

  cluster_autoscaling {
    enabled = var.cluster_autoscaling.enabled
    dynamic "auto_provisioning_defaults" {
      for_each = var.cluster_autoscaling.enabled ? [1] : []

      content {
        service_account = local.service_account
        oauth_scopes = [
          "https://www.googleapis.com/auth/cloud-platform"
        ]
      }
    }
    dynamic "resource_limits" {
      for_each = local.autoscaling_resource_limits
      content {
        resource_type = lookup(resource_limits.value, "resource_type")
        minimum       = lookup(resource_limits.value, "minimum")
        maximum       = lookup(resource_limits.value, "maximum")
      }
    }
  }
  
  dynamic "private_cluster_config" {
      for_each = var.enable_private_nodes ? [{
      enable_private_nodes    = var.enable_private_nodes,
      enable_private_endpoint = var.enable_private_endpoint
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
      }] : []

      content {
          enable_private_endpoint = private_cluster_config.value.enable_private_endpoint
          enable_private_nodes    = private_cluster_config.value.enable_private_nodes
          master_ipv4_cidr_block  = private_cluster_config.value.master_ipv4_cidr_block
          dynamic "master_global_access_config" {
              for_each = var.master_global_access_enabled ? [var.master_global_access_enabled] : []
              content {
              enabled = master_global_access_config.value
              }
          }
      }
  }

  master_authorized_networks_config {
              cidr_blocks {
                  cidr_block = "10.0.0.2/32" #admin server's ip
              }
  }
}

resource "google_container_node_pool" "mainpool" {
    cluster                     = google_container_cluster.cluster.name
    location                    = "asia-northeast3"
    max_pods_per_node           = 110
    name                        = "default-pool"
    node_count                  = 1
    node_locations              = [
        "asia-northeast3-a",
        "asia-northeast3-b",
        "asia-northeast3-c",
    ]
    project                     = "hybrid-bts"
    version                     = "1.21.5-gke.1302"

    management {
        auto_repair  = true
        auto_upgrade = true
    }

    node_config {
        disk_size_gb      = 10
        disk_type         = "pd-standard"
        guest_accelerator = []
        image_type        = "COS_CONTAINERD"
        labels            = {}
        local_ssd_count   = 0
        machine_type      = "e2-micro"
        metadata          = {
            "disable-legacy-endpoints" = "true"
        }
        oauth_scopes      = [
            "https://www.googleapis.com/auth/cloud-platform",
            "https://www.googleapis.com/auth/userinfo.email",
        ]
        preemptible       = false
        service_account   = "build-ser-acc@hybrid-bts.iam.gserviceaccount.com"
        tags              = []
        taint             = []

        shielded_instance_config {
            enable_integrity_monitoring = true
            enable_secure_boot          = false
        }
    }

    timeouts {}

    upgrade_settings {
        max_surge       = 1
        max_unavailable = 0
    }
}

locals {
  autoscaling_resource_limits = var.cluster_autoscaling.enabled ? concat([{
    resource_type = "cpu"
    minimum       = var.cluster_autoscaling.min_cpu_cores
    maximum       = var.cluster_autoscaling.max_cpu_cores
    }, {
    resource_type = "memory"
    minimum       = var.cluster_autoscaling.min_memory_gb
    maximum       = var.cluster_autoscaling.max_memory_gb
  }], var.cluster_autoscaling.gpu_resources) : []
}