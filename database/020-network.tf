#### NETWORK CONFIGURATION ####

# Router creation
resource "openstack_networking_router_v2" "toExt" {
  name                = "toExt"
  external_network_id = var.external_gateway
}

# Network creation
resource "openstack_networking_network_v2" "DBprivate" {
  name = "DBprivate"
}


# Subnet db configuration
resource "openstack_networking_subnet_v2" "db" {
  name            = var.network_db["subnet_name"]
  network_id      = openstack_networking_network_v2.DBprivate.id
  cidr            = var.network_db["cidr"]
  dns_nameservers = var.dns_ip
}

# Router interface configuration
resource "openstack_networking_router_interface_v2" "dbc" {
  router_id = openstack_networking_router_v2.toExt.id
  subnet_id = openstack_networking_subnet_v2.db.id
}

