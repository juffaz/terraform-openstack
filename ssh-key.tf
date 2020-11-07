resource "openstack_compute_keypair_v2" "edoc-key" {
  name       = "edoc-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA3LCv0So5IOd6MkRNhZqEembI4hxGBhFHvrV6pxOArJ+jD+dPmBcLOVRx+AftFwrz9M/+c6l88Z5r1s6TU7b/QUDrrMGbeV/RPxSuOAxDmRjVVmxUKh57kIJmrvl4wtz1mvgxz6SecUMOueAEh8V+BTtuuXb0T7+NEszP62F+h6hItHUqIEua8fAk3FlIBGQY5aOGnbm0lfbA83/DnPGaHAaZz++Pss9BE3+mPmvJJNTbCZqPOPlKvVMsci5UTZuOakBAjdLLKkJHYNOdW0SwpLtTj+8NREyn6Djc70reewOqj/Mdy1szhPETwiXL5f17kRHxMtK0DgbUMPhq6V+57w== devops@centreon01"
}
