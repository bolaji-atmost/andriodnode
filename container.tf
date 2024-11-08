resource "lxd_container" "andriod_node" {
  count = 1
  name  = "andriod-node-${count.index + 1}"
  image = var.ubuntu["focal"]
  profiles  = ["${lxd_profile.andriod_node_profile.name}"]
  ephemeral = false
}
