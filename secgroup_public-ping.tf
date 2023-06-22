resource "openstack_networking_secgroup_v2" "public-ping" {
  name                 = "public-ping"
  description          = "[tf] Allow pinging the node to the public"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "public-ping_rule" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  security_group_id = openstack_networking_secgroup_v2.public-ping.id
}
