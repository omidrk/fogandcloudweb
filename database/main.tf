# Configure the OpenStack Provider
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}
provider "openstack" {
  user_name   = "web-member"
  tenant_name = "member"
  password    = "password"
  auth_url    = "http://10.235.1.217/identity"
  region      = "RegionOne"
  user_domain_name= "Default"
}
