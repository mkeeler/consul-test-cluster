variable "num_servers" {
  default = 3
}

variable "num_clients" {
  default = 2
}

variable "image" {
  default = "consul"
}

variable "container_basename" {
  default = "consul"
}

variable "docker_net_driver" {
  default = "bridge"
}

variable "docker_net_create" {
  default = 1
}

variable "docker_net_name" {
  default = "bridge"
}

variable "docker_net_check_dup" {
  default = true
}

variable "docker_net_options" {
  type = "map"
  default = {
    "com.docker.network.bridge.enable_icc" = "true"
    "com.docker.network.bridge.enable_ip_masquerade" = "true"
  }
}

variable "docker_net_internal" {
  default = false
}

variable "docker_net_ipam" {
  type = "list"
  default = []
}

variable "server_labels" {
  type = "map"
  default = {
    "consul.cluster.nodetype" = "server"
  }
}

variable "nonvoting_labels" {
  type = "map"
  default = {
    "consul.cluster.nodetype" = "non-voting-server"
  }
}

variable "client_labels" {
  type = "map"
  default = {
    "consul.cluster.nodetype" = "client"
  }
}