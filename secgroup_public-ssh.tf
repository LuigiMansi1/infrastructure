resource "openstack_networking_secgroup_v2" "public-ssh" {
  name                 = "public-ssh"
  description          = "[tf] Allow SSH connections from anywhere"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "public-ssh_rule4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = "22"
  port_range_max    = "22"
  security_group_id = openstack_networking_secgroup_v2.public-ssh.id
}

resource "openstack_networking_secgroup_rule_v2" "public-ssh_rule6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = "22"
  port_range_max    = "22"
  security_group_id = openstack_networking_secgroup_v2.public-ssh.id
}
