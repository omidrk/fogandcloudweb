#### INSTANCE DB ####
resource "openstack_networking_port_v2" "port_1" {
  name               = "port_1"
  network_id         = "${openstack_networking_network_v2.DBprivate.id}"
  admin_state_up     = "true"
  security_group_ids = [openstack_compute_secgroup_v2.db.id,openstack_compute_secgroup_v2.ssh.id]

  fixed_ip {
    subnet_id  = "${openstack_networking_subnet_v2.db.id}"
    ip_address = "192.168.10.110"
  }
}
# Create instance
#
resource "openstack_compute_instance_v2" "mongodb" {
  name        = "db1"
  image_name  = var.image
  flavor_name = var.flavor_db
  key_pair    = "${openstack_compute_keypair_v2.webmemberauto.name}"
  user_data   = file("scripts/initme.sh")
  network {
    port = openstack_networking_port_v2.port_1.id
  }
}

# Create network port
resource "openstack_networking_port_v2" "portdb" {
  name           = "port-instance-db"
  network_id     = openstack_networking_network_v2.DBprivate.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.ssh.id,
    openstack_compute_secgroup_v2.db.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.db.id
  }
}

# Create floating ip
resource "openstack_networking_floatingip_v2" "floatdb" {
  pool = var.external_network
}

# Attach floating ip to instance
resource "openstack_compute_floatingip_associate_v2" "floatdb" {
  floating_ip = openstack_networking_floatingip_v2.floatdb.address
  instance_id = openstack_compute_instance_v2.mongodb.id
}
output "instance_ips" {
  value = openstack_networking_floatingip_v2.floatdb.address
}
#### VOLUME MANAGEMENT ####

# Create volume
resource "openstack_blockstorage_volume_v2" "dbstorage" {
  name = "volume-db"
  size = var.volume_db
}

# Attach volume to instance instance db
resource "openstack_compute_volume_attach_v2" "dbstorage" {
  instance_id = openstack_compute_instance_v2.mongodb.id
  volume_id   = openstack_blockstorage_volume_v2.dbstorage.id
}


