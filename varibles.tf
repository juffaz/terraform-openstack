variable "image" {
  type    = string
  default = "debian-9.4.2-20180330-openstack-amd64"
}

#### NEUTRON
variable "external_network" {
  type    = string
  default = "external"
}

# UUID of external gateway
variable "external_gateway" {
  type    = string
  default = "14b561b8-a84b-4894-848d-8893aed41cd8"
}

variable "dns_ip" {
  type    = list(string)
  default = ["8.8.8.8", "8.8.8.4"]
}

#### VM parameters
variable "flavor_http" {
  type    = string
  default = "cpu_2_ram_4g"
}

variable "network_http" {
  type    = map(string)
  default = {
    subnet_name = "subnet-http"
    cidr        = "192.168.57.0/24"
  }
}
