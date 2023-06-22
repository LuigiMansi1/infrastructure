### CHANGE TO YOUR CLOUD VARS ###
variable "vgcn_image" {
  type = map(any)
  default = {
    "name"             = "vggp-v60-j225-1a1df01ec8f3-dev.raw"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v60-j225-1a1df01ec8f3-dev.raw"
    "container_format" = "bare"
    "disk_format"      = "raw"
    "description"      = "downloaded from https://usegalaxy.eu/static/vgcn/"
  }
}

variable "rocky9_image" {
  type = map(any)
  default = {
    "name"             = "Rocky-9-GenericCloud.latest.x86_64"
    "image_source_url" = "https://download.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2"
    "container_format" = "bare"
    "disk_format"      = "QCOW2"
    "description"      = "downloaded from https://download.rockylinux.org"
  }
}

variable "nfs" {
  type = map(any)
  default = {
    "name"        = "nfs"
    "description" = "nfs volume"
    "disk_size"   = 300
    "volume_type" = "__DEFAULT__"
  }
}

variable "private_network" {
  type = map(any)
  default = {
    "name" = "elixir-network"
  }
}

variable "public_network" {
  type = map(any)
  default = {
    "name" = "externalNetwork"
  }
}

variable "flavors" {
  type = map(any)
  default = {
    "central-manager" = "fl.ada.s"
    "database"        = "fl.ada.l"
    "replica"         = "fl.ada.s"
    "backup"          = "fl.ada.s"
    "galaxy"          = "fl.ada.l"
    "mastervm"        = "fl.ada.s"
    "nfs-server"      = "fl.ada.m"
    "rabbitmq"        = "fl.ada.s"
    "ftp"             = "fl.ada.s"
  }
}

# add here your newly generated public key
variable "public_key" {
  type = map(any)
  default = {
    name       = "cloud"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCv0/H8VaGgmIaOZ04HYKZKssZARXf2QPB6JGmlbiFpwA7MxakuBkPzm9t+UsGd6vWZ+LDQY+MdZNGt2Nm0e/0TJO9Ilxc/nANPYqR5rzOBFUkXlKw57zxmXVr6Aamrl5ePS13zUNeM34PKG78CA92quG0YNjYeCZon4UiyAfXHzdcvTcwn2lbRsaxMTDxlO8r7ZKf9rDuyjf4Q98hVqDjN57+3ZIoU4o9PBJg+8TpiCe5igMtM53WmbhUk1EuiZoB6Hnc+OpaoPhFAjcxANVw4CMII5YzxN9YCdk9jAPXE4WEb1vnSm9HWoOuZiJoOgb2ngeTX5maioUP7ugVJyE7N9iaFMCz4P7cjfEKHu01EgP8H7Ts65DqcX4Xu8pUYbCPBHzvUFcHDngV/mG2Fabk4MOrdoGC2DXKKE+LRVjEDlaXMVN7kc3qKP9/4euna6gBoIp530MgRitIGmlPHyMKAeRfIXz2e7FONCUSzRHp4deo127fzl79hVOFUacnEbg8= pokhmel@master"
  }
}

variable "web-ports" {
  description = "Web ports"
  type        = list(string)
  default     = ["80", "443", "8080"]
}
