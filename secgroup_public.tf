resource "openstack_networking_secgroup_v2" "public" {
  name                 = "public"
  description          = "[tf] Completely public machine (ingress + egress)"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "public_rule3" {
  direction         = "egress"
  ethertype         = "IPv6"
  security_group_id = openstack_networking_secgroup_v2.public.id
}

resource "openstack_networking_secgroup_rule_v2" "public_rule4" {
  direction         = "egress"
  ethertype         = "IPv4"
  security_group_id = openstack_networking_secgroup_v2.public.id
}

resource "openstack_networking_secgroup_rule_v2" "public_rule5" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "22"
  port_range_max    = "22"
  security_group_id = openstack_networking_secgroup_v2.public.id
}

resource "openstack_networking_secgroup_rule_v2" "public_rule6" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "80"
  port_range_max    = "80"
  security_group_id = openstack_networking_secgroup_v2.public.id
}
