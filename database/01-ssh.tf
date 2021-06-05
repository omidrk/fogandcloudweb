# Define ssh to config in instance

resource "openstack_compute_keypair_v2" "webmemberauto" {
  name       = "webmemberauto"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC52dktMp4QvFFihGIvjEZJkqb9DlfILnojko6ON6OuErP0tK8C7wxhsyxNMSX0bilroPYhzcNLbMEHeVclcRrm8uti5Ttn05wpPm/6pPRGrqugPRg0yZqeB7y/+OrFh1sgY86uqiI8gVYgkphMw3L/y0NgP8fLoKZC2xsVrHglbqxYI+pe5ZbjUInrakriUBWepVmm82ufTcrxLSuuwiGGeACQG6X4i5H9CgFgkJorS2VCFU0wwvXccVlUXqaeefiCKFhqb0LPna29DnBzfAG3PiAxWzgOG8qYANgK1iFFtD4sJgcTZPOW+8pSSeSxTiQ/tiqw530nRX3mMhOAakrz"
}


