# private_ip
output "galaxy" {
  value = openstack_compute_instance_v2.galaxy.network[0].fixed_ip_v4
}

output "galaxy_fl_ip" {
  value = openstack_networking_floatingip_v2.galaxy_fl_ip.address
}

# private_ip
output "mastervm" {
  value = openstack_compute_instance_v2.mastervm.network[0].fixed_ip_v4
}

# private_ip
output "nfs-server" {
  value = openstack_compute_instance_v2.nfs-server.network[0].fixed_ip_v4
}

# private_ip
output "database" {
  value = openstack_compute_instance_v2.postgres.network[0].fixed_ip_v4
}

# private_ip
output "replica" {
  value = openstack_compute_instance_v2.replica.network[0].fixed_ip_v4
}

# private_ip
output "backup" {
  value = openstack_compute_instance_v2.backup.network[0].fixed_ip_v4
}

# private_ip
output "rabbitmq" {
  value = openstack_compute_instance_v2.rabbitmq.network[0].fixed_ip_v4
}

output "rabbitmq_fl_ip" {
  value = openstack_networking_floatingip_v2.rabbitmq_fl_ip.address
}

# private_ip
output "central-manager" {
  value = openstack_compute_instance_v2.vgcn-cm.network[0].fixed_ip_v4
}

output "central-manager_fl_ip" {
  value = openstack_networking_floatingip_v2.vgcn_fl_ip.address
}
