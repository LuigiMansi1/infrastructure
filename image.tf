### comment out totally if you have the images uploaded ###

resource "openstack_images_image_v2" "vgcn_image" {
  name             = var.vgcn_image.name
  image_source_url = var.vgcn_image.image_source_url
  container_format = var.vgcn_image.container_format
  disk_format      = var.vgcn_image.disk_format
  properties = {
    description = var.vgcn_image.description
  }
}

resource "openstack_images_image_v2" "rocky_image" {
  name             = var.rocky9_image.name
  image_source_url = var.rocky9_image.image_source_url
  container_format = var.rocky9_image.container_format
  disk_format      = var.rocky9_image.disk_format

  properties = {
    description = var.rocky9_image.description
  }
}

