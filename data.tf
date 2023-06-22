data "openstack_images_image_v2" "vgcn_image" {
  name        = var.vgcn_image.name
  most_recent = true
}

data "openstack_images_image_v2" "rocky_image" {
  name        = var.rocky9_image.name
  most_recent = true
}

