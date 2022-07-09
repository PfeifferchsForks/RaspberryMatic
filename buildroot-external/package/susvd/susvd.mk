################################################################################
#
# S.USV Support (www.s-usv.de)
#
################################################################################

SUSVD_VERSION = 2.40
SUSVD_SOURCE =
SUSVD_LICENSE = PROPERITARY

define SUSVD_INSTALL_TARGET_CMDS
	cp -a $(SUSVD_PKGDIR)/rootfs-overlay/* $(TARGET_DIR)/
endef

define SUSVD_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 0755 $(SUSVD_PKGDIR)/S51susvd \
		$(TARGET_DIR)/etc/init.d/S51susvd
endef

$(eval $(generic-package))
