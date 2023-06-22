resource "openstack_compute_instance_v2" "nfs-server" {
  name            = "usegalaxy-it.condor-nfs"
  image_name      = data.openstack_images_image_v2.vgcn_image.name
  flavor_name     = var.flavors.nfs-server
  key_pair        = openstack_compute_keypair_v2.cloud.name
  security_groups = ["public-ssh", "egress"]

  network {
    name = var.private_network.name
  }

  block_device {
    uuid                  = data.openstack_images_image_v2.rocky_image.id
    source_type           = "image"
    destination_type      = "local"
    boot_index            = 0
    delete_on_termination = true
  }

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.nfs_volume.id
    source_type           = "volume"
    destination_type      = "volume"
    boot_index            = -1
    delete_on_termination = true
  }
  user_data = file("files/create_share.sh")
}

resource "openstack_blockstorage_volume_v3" "nfs_volume" {
  name        = var.nfs.name
  description = var.nfs.description
  volume_type = var.nfs.volume_type
  size        = var.nfs.disk_size
}

# data "template_cloudinit_config" "nfs-share" {
#  gzip          = true
#  base64_encode = true

#  part {
#    content_type = "text/x-shellscript"
#    content      = file("${path.module}/files/create_share.sh")
#  }

# }



