variable "proxmox_endpoint" {
  description = "Proxmox VE API endpoint"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "proxmox_node" {
  description = "Proxmox node name"
  type        = string
  default     = "HomeServer"
}

variable "image_datastore" {
  description = "Datastore used for cloud images"
  type        = string
  default     = "local"
}

variable "vm_datastore" {
  description = "Datastore used for VM disks"
  type        = string
  default     = "local-lvm"
}

variable "vm_bridge" {
  description = "Proxmox network bridge"
  type        = string
  default     = "vmbr0"
}

variable "vm_id" {
  description = "Proxmox VM ID"
  type        = number
  default     = 121
}

variable "vm_name" {
  description = "VM hostname"
  type        = string
  default     = "gitlab-runner01"
}

variable "vm_username" {
  description = "Cloud-init Linux user"
  type        = string
  default     = "ansible"
}

variable "vm_cpu_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "RAM in MB"
  type        = number
  default     = 4096
}

variable "vm_disk_size" {
  description = "Disk size in GB"
  type        = number
  default     = 32
}

variable "ssh_public_key_path" {
  description = "SSH public key injected by cloud-init"
  type        = string
  default     = "/home/ansible/.ssh/id_rsa.pub"
}
