resource "lxd_network" "andriodNode_net" {
  name = "andriodNode_net"
  config = {
    "ipv4.address" = "10.0.1.1/24"
    "ipv4.nat"     = "true"
  }
}
