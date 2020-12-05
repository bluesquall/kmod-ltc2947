Linux Kernel Module LTC2947
===========================

This is a small repository for an out-of-tree build of the LTC2947 kernel
module. It is intended for use on a BeagleBone until the driver gets into
the upstream beagleboard repository.

out-of-tree module compilation
------------------------------

This is what we're really interested in right now.

```shell
sudo apt-get install linux-headers-$(uname -r)
find /lib/modules/$(uname -r) -iname "*ltc*"
make
```

- To see the information on a module: `sudo modinfo ltc2947-spi.ko`

- To load the module: `sudo insmod ./ltc2947-core.ko && sudo insmod ./ltc2947-spi.ko`

  * And to confirm it is loaded: `grep ltc2947 /proc/modules`

- Then to remove the module: `sudo rmmod ltc2947-spi && sudo rmmod ltc2947-core`

On older kernels, you would see messages in `/var/log/messages`, but on newer
systems, check `journalctl -xe` instead. You should see any `printk` messages
from the module.

If you have two terminals open, you can follow along with `journalctl -f`.

TO-DO:
------

- Install the built modules. (manually? or is there a different best practice?)

- Use the loaded module to interface with the chip on the Mikroe click.

References:
-----------

- [TLDP LKMPG]

- [Arch Linux Wiki][ALW compile kernel module]

_____________
[TLDP LKMPG]: http://tldp.org/LDP/lkmpg/2.6/html/index.html
[ALW compile kernel module]: https://wiki.archlinux.org/index.php/Compile_kernel_module
