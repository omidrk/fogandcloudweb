# Params file for variables

#### GLANCE
variable "image" {
  type    = string
  default = "ubuntu-18"
}

#### NEUTRON
variable "external_network" {
  type    = string
  default = "public"
}

# UUID of external gateway
variable "external_gateway" {
  type    = string
  default = "56872cc5-5975-4c25-9dfb-b53e3eecabe0"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

#### VM HTTP parameters ####
# variable "flavor_http" {
#   type    = string
#   default = "t2.medium"
# }

variable "network_db" {
  type = map(string)
  default = {
    subnet_name = "subnet-db"
    cidr        = "192.168.10.100/24"
  }
}

#### MAIN DISK SIZE FOR HTTP
# variable "volume_http" {
#   type    = number
#   default = 10
# }

#### VM DB parameters ####
variable "flavor_db" {
  type    = string
  default = "ds1G"
}

#### ATTACHED VOLUME PARAMS
variable "volume_db" {
  type    = number
  default = 10
}

