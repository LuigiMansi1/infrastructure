resource "openstack_compute_instance_v2" "postgres" {
  name            = "usegalaxy-it.database"
  image_name      = data.openstack_images_image_v2.rocky_image.name
  flavor_name     = var.flavors.database
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "private-db", "egress"]

  network {
    name = var.private_network.name
  }
}

