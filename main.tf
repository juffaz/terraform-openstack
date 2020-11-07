resource "openstack_blockstorage_volume_v2" "myvol" {
  name = "myvol"
  size = 40
}

resource "openstack_compute_instance_v2" "edoc" {
  name            = "edoc"
  image_name      = var.image
  flavor_name     = var.flavor_http
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
    name = openstack_networking_port_v2.edoc.id
  }
  user_data = "${file("script.sh")}"
}

resource "openstack_networking_port_v2" "edoc" {
  name           = "port-instance-http"
  network_id     = openstack_networking_network_v2.generic.id
  admin_state_up = true
  security_group_ids = [
    openstack_compute_secgroup_v2.ssh.id,
    openstack_compute_secgroup_v2.http.id,
  ]
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.edoc.id
  }
}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = var.external_network
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${openstack_networking_floatingip_v2.fip_1.address}"
  instance_id = "${openstack_compute_instance_v2.edoc.id}"
}
