KDIR ?= /lib/modules/`uname -r`/build

DDIR ?= /lib/modules/`uname -r`/kernel/drivers/hwmon
CDIR ?= /usr/lib/modules-load.d
INSTALL = /usr/bin/install -c

default:
	$(MAKE) -C $(KDIR) M=$$PWD

.PHONY: install
install: default
	$(INSTALL) ltc2947-core.ko $(DDIR)
	$(INSTALL) ltc2947-i2c.ko $(DDIR)
	$(INSTALL) ltc2947-spi.ko $(DDIR)
	$(INSTALL) ltc2947_modules.conf $(CDIR)
