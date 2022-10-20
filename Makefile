ROOT 	= ""
PRJECT	= "bchacktool3"
PREFIX	= $(ROOT)/usr
BINDIR	= $(PREFIX)/bin
SRCDIR	= $(PREFIX)/share/$(PRJECT)

define install
	echo ok
endef

define uninstall
	rm -rf $(SRCDIR) $(BINDIR)/bchacktool3
endef

define clean
	rm -rf ./shtandard ./kiss
endef

install:
	@$(install)
	@echo "installed."

uninstall:
	@$(uninstall)
	@echo "uninstalled."

reinstall:
	@$(uninstall)
	@$(install)
	@echo "reinstalled."

clean:
	@$(clean)
	@echo "cleaned."