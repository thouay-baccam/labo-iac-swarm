terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://192.168.1.50:8006/"
  api_token = "root@pam!terraform=${var.pm_token_secret}"
  insecure  = true
}
