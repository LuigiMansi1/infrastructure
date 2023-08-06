resource "openstack_compute_instance_v2" "rabbitmq" {
  name            = "usegalaxy-it.rabbitmq"
  image_name      = data.openstack_images_image_v2.rocky_image.name
  flavor_name     = var.flavors.rabbitmq
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "public-ping", "public-amqp", "public-web", "egress"]

  # network {
  #   name = var.public_network.name
  # }
  network {
    name = var.private_network.name
  }
}

resource "openstack_networking_floatingip_v2" "rabbitmq_fl_ip" {
  pool = var.public_network.name
}

resource "openstack_compute_floatingip_associate_v2" "rabbitmq_fl_ip" {
  floating_ip = openstack_networking_floatingip_v2.rabbitmq_fl_ip.address
  instance_id = openstack_compute_instance_v2.rabbitmq.id
}

