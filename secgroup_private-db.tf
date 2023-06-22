resource "openstack_networking_secgroup_v2" "db" {
  name                 = "private-db"
  description          = "[tf] Allow db connections"
  delete_default_rules = "true"
}

resource "openstack_networking_secgroup_rule_v2" "private-db-rule4" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "5432"
  port_range_max    = "5432"
  security_group_id = openstack_networking_secgroup_v2.db.id
}

resource "openstack_networking_secgroup_rule_v2" "private-db-rule6" {
  direction         = "ingress"
  ethertype         = "IPv6"
  protocol          = "tcp"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = "5432"
  port_range_max    = "5432"
  security_group_id = openstack_networking_secgroup_v2.db.id
}
