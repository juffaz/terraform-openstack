resource "openstack_blockstorage_volume_v2" "myvol" {
  name = "myvol"
  size = 40
}

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
}

resource "openstack_compute_instance_v2" "edoc" {
  name            = "edoc"
  image_name      = "debian-9.4.2-20180330-openstack-amd64"
  flavor_name     = "cpu_2_ram_4g"
  key_pair        = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = [ "default", "${openstack_compute_secgroup_v2.edoc_group.name}" ]

  block_device {
    uuid                  = "92ef4995-2b88-4c7d-a94d-7b99130f80a4"
    source_type           = "image"
    volume_size           = 30 
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }


  network {
    name = "vatportal_net"
  }
  user_data = "${file("script.sh")}"
}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "external"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_1.address}"
  instance_id = "${openstack_compute_instance_v2.edoc.id}"
}
