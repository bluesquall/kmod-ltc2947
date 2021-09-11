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
systems, check `journalctl -xe` instead. If you have two terminals open, you
can follow along with `journalctl -f`.

installation
------------

After you've compiled the modules and verified that they load and unload
manually, you can install them in the system by:

```shell
sudo make install
```

This puts the `.ko` files under `/lib/modules/$(uname -r)/kernel/drivers/hwmon`
and adds `ltc2947_modules.conf` under `/usr/lib/modules-load.d`.

You may need to copy `ltc2947_modules.conf` to `/etc/modules-load.d` and modify
it there, depending on your system.

References:
-----------

- [The (original) Linux Kernel Module Programming Guide][TLDP LKMPG]

- [The (updated) Linux Kernel Module Programming Guide (with working examples for 5.x kernels)][sysprog21 LKMPG]

- [Arch Linux Wiki][ALW compile kernel module]

_____________
[TLDP LKMPG]: http://tldp.org/LDP/lkmpg/2.6/html/index.html
[sysprog21 LKMPG]: https://sysprog21.github.io/lkmpg/
[ALW compile kernel module]: https://wiki.archlinux.org/index.php/Compile_kernel_module
[ltc2947 kernel drivers]: https://www.kernel.org/doc/html/latest/hwmon/ltc2947.html
[ltc2947 SPI source]: https://github.com/torvalds/linux/blob/master/drivers/hwmon/ltc2947-spi.c
