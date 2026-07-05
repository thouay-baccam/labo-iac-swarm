resource "proxmox_virtual_environment_vm" "swarm_worker2" {
  name      = "swarm-worker2"
  node_name = "pve"

  clone {
    vm_id = 200
    full  = true
  }

  disk {
    datastore_id  = "local-lvm"
    interface	  = "scsi0"	
    size	  = 20
}

  cpu {
    cores = 2
  }
  memory {
    dedicated = 2048
  }

  network_device {
    bridge  = "vmbr1"
    vlan_id = 10
  }

  initialization {
    ip_config {
      ipv4 {
        address = "10.10.10.13/24"
        gateway = "10.10.10.1"
      }
    }
    user_account {
      username = "swarm-manager"
      keys     = [trimspace(file("/home/ansible-control/.ssh/authorized_keys"))]
    }
    dns {
      servers = ["1.1.1.1", "8.8.8.8"]
    }
  }
}

output "swarm_worker2_ip" {
  value = "10.10.10.13"
}

resource "proxmox_virtual_environment_vm" "swarm_worker3" {
  name      = "swarm-worker3"
  node_name = "pve"

  clone {
    vm_id = 200
    full  = true
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 20
  }

  cpu {
    cores = 2
  }
  memory {
    dedicated = 2048
  }

  network_device {
    bridge  = "vmbr1"
    vlan_id = 10
  }

  initialization {
    ip_config {
      ipv4 {
        address = "10.10.10.14/24"
        gateway = "10.10.10.1"
      }
    }
    user_account {
      username = "swarm-manager"
      keys     = [trimspace(file("/home/ansible-control/.ssh/authorized_keys"))]
    }
    dns {
      servers = ["1.1.1.1", "8.8.8.8"]
    }
  }
}

output "swarm_worker3_ip" {
  value = "10.10.10.14"
}
