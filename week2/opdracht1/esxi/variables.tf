variable "esxi_hostname" {
  description = "IP or hostname of your ESXi host"
  type        = string
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_hostssl" {
  default = "443"
}

variable "esxi_username" {
  default = "root"
}

variable "esxi_password" {
  description = "Root password for ESXi"
  type        = string
  sensitive   = true
}

variable "virtual_network" {
  default = "VM Network"
}

variable "disk_store" {
  default = "datastore1"
}

variable "ovf_file" {
  description = "Ubuntu cloud image OVA/OVF"
  default     = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.ova"
}

