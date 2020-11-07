resource "openstack_compute_secgroup_v2" "app_group" {
  name = "app_group"
  description = "app Group"
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

}

resource "openstack_compute_secgroup_v2" "db_group" {
  name = "db_group"
  description = "db Group"
  #region = "RegionOne"

   rule {
    ip_protocol = "tcp"
    from_port = "5432"
    to_port = "5432"
    cidr = "0.0.0.0/0"
  }

}
