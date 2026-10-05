resource "proxmox_virtual_environment_vm" "gitlab_runner01" {
  name        = var.vm_name
  description = "GitLab CI runner for AIS DevSecOps homelab"

  node_name = var.proxmox_node
  vm_id     = var.vm_id

  started         = true
  on_boot         = true
  stop_on_destroy = true

  tags = [
    "terraform",
    "ansible",
    "ubuntu",
    "gitlab",
    "runner",
    "devsecops"
  ]

  cpu {
    cores = var.vm_cpu_cores
    type  = "host"
  }

  memory {
    dedicated = var.vm_memory
  }

  scsi_hardware = "virtio-scsi-single"

  disk {
    datastore_id = var.vm_datastore
    import_from  = "local:import/noble-server-cloudimg-amd64.qcow2"
    interface    = "scsi0"

    size     = var.vm_disk_size
    iothread = true
    discard  = "on"
  }

  network_device {
    bridge = var.vm_bridge
    model  = "virtio"
  }

  serial_device {
    device = "socket"
  }

  agent {
    enabled = true

    wait_for_ip {
      disabled = true
    }
  }

  initialization {
    datastore_id = var.vm_datastore

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = var.vm_username

      keys = [
        trimspace(file(pathexpand(var.ssh_public_key_path)))
      ]
    }
  }

  operating_system {
    type = "l26"
  }
}
