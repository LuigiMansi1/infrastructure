resource "openstack_networking_secgroup_v2" "public-tus" {
  name                 = "public-tus"
  description          = "[tf] Allow tus connections from anywhere"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "public-tus_rule4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = "1080"
  port_range_max    = "1080"
  security_group_id = openstack_networking_secgroup_v2.public-tus.id
}

resource "openstack_networking_secgroup_rule_v2" "public-tus_rule6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  port_range_min    = "1080"
  port_range_max    = "1080"
  security_group_id = openstack_networking_secgroup_v2.public-tus.id
}
