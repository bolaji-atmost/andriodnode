resource "lxd_profile" "andriod_node_profile" {
  name = "andriod_node_profile" 
  config = { 
    "limits.cpu" = 1 
    "limits.memory"  = "2GB"
    "limits.memory.swap" = false
    "linux.kernel_modules" = "ip_tables,ip6_tables,netlink_diag,nf_nat,overlay"
    "raw.lxc"              = "lxc.apparmor.profile=unconfined\nlxc.cap.drop= \nlxc.cgroup.devices.allow=a\nlxc.mount.auto=proc:rw sys:rw\nlxc.mount.entry = /dev/kmsg dev/kmsg none defaults,bind,create=file"
    "boot.autostart"       = true
    "security.privileged"  = true
    "security.nesting"     = true
    "boot.autostart.delay" = 1
    "user.user-data" = "${file("./user-data.yaml")}"

  }
  device {
    name = "eth0"
    type = "nic"

    properties = {
      nictype = "bridged"
      parent  = "${lxd_network.andriodNode_net.name}"
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = "default"
      path = "/"
      size = "10GB"
    }
  }

  device {
    type = "proxy"
    name = "andriod-proxy"

    properties = {
      listen  = "tcp:0.0.0.0:3000"
      connect = "tcp:127.0.0.1:3000"
      bind    = "host"
    }
  }
}

