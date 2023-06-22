resource "openstack_compute_instance_v2" "replica" {
  name            = "usegalaxy-it.database-replica"
  image_name      = data.openstack_images_image_v2.rocky_image.name
  flavor_name     = var.flavors.replica
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "private-db", "egress"]

  network {
    name = var.private_network.name
  }
}
