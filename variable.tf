variable "images" {
  type    = string
  default = "ubuntu:focal"
}

variable "ubuntu" {
  type = map(any)
  default = {
    "focal"   = "ubuntu:22.04"
    "bionic"  = "images:ubuntu/bionic/cloud"
    "xenial"  = "images:ubuntu/xenial/cloud"
    "kinetic" = "images:ubuntu/kinetic/cloud"
    "impish"  = "images:ubuntu/impish/cloud"
    "jammy"   = "images:ubuntu/jammy/cloud"
  }
}

variable "node_name" {
  type = map(string)
  default = {
    andriod = "andriod_node"
  }
}
