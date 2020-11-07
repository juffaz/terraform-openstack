resource "openstack_compute_secgroup_v2" "edoc_group" {
  name = "edoc_group"
  description = "edoc Group"
  #region = "RegionOne"

  rule {
    ip_protocol = "tcp"
    from_port = "22"
    to_port = "22"
    cidr = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = "22"
    to_port = "22"
    cidr = "::/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = "80"
    to_port = "80"
    cidr = "0.0.0.0/0"
  }

  rule {
    ip_protocol = "tcp"
    from_port = "443"
    to_port = "443"
    cidr = "0.0.0.0/0"
  }

   rule {
    ip_protocol = "tcp"
    from_port = "3000"
    to_port = "3000"
    cidr = "0.0.0.0/0"
  }

   rule {
    ip_protocol = "tcp"
    from_port = "5432"
    to_port = "5432"
    cidr = "0.0.0.0/0"
  }

}