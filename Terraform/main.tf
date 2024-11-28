terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
       }
  }
}
provider "proxmox" {
  pm_api_url = "https://172.16.90.142:8006/api2/json"
  pm_api_token_id = "ciber@pam!ciber_token_id"
  pm_api_token_secret = "6a0a2fed-9b93-46d2-9280-6670b533d9d6"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "BBDD" {
  count       = 1
  name        = "BBDD"
  target_node = var.proxmox_host
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  cpu         = "qemu64"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = "almacen01"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = "ip=172.16.90.151/24,gw=172.16.90.2"

  ssh_user = "ubuntu"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname servidorBBDD",
      "sudo apt-get update -y",
      "sudo apt-get install -y python-pip",
      "sudo exit 0"
    ]

    connection {
      type        = "ssh"
      host        = "172.16.90.151"
      user        = "ubuntu"
      private_key = file("/home/ciber2/.ssh/id_rsa")
    }
  }
}

resource "proxmox_vm_qemu" "WEB2" {
  count       = 1
  name        = "WEB2"
  target_node = var.proxmox_host
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  cpu         = "qemu64"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  
  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = "almacen01"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = "ip=172.16.90.152/24,gw=172.16.90.2"
  
  ssh_user = "ubuntu"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname servidorWeb",
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo exit 0"
    ]

    connection {
      type        = "ssh"
      host        = "172.16.90.152"
      user        = "ubuntu"
      private_key = file("/home/ciber2/.ssh/id_rsa")
    }
  }
}

resource "proxmox_vm_qemu" "WEB3" {
  count       = 1
  name        = "WEB3"
  target_node = var.proxmox_host
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  cpu         = "qemu64"
  memory      = 2048
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  
  disk {
    slot = 0
    size = "32G"
    type = "scsi"
    storage = "almacen01"
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = "ip=172.16.90.153/24,gw=172.16.90.2"
  
  ssh_user = "ubuntu"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
  
  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname servidorWeb2",
      "sudo apt-get update -y",
      "sudo apt-get upgrade -y",
      "sudo apt-get install -y apache2",
      "sudo exit 0"
    ]

    connection {
      type        = "ssh"
      host        = "172.16.90.153"
      user        = "ubuntu"
      private_key = file("/home/ciber2/.ssh/id_rsa")
    }
  }
}
