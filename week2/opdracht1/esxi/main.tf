terraform {
  required_version = ">= 1.6.0"
  required_providers {
    esxi = {
      source  = "josenk/esxi"
      version = "1.10.3"
    }
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

resource "esxi_guest" "ubuntu_vm" {
  guest_name   = "iac-week2-1a"
  disk_store   = var.disk_store
  numvcpus     = 1
  memsize      = 1024
  ovf_source   = var.ovf_file

  network_interfaces {
    virtual_network = var.virtual_network
  }

  power = "on"
}

