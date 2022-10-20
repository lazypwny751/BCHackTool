ROOT 	= ""
PRJECT	= "bchacktool3"
PREFIX	= $(ROOT)/usr
BINDIR	= $(PREFIX)/bin
SRCDIR	= $(PREFIX)/share/$(PRJECT)

define sub
	git clone https://github.com/lazypwny751/shtandard.git 2> /dev/null ; cd shtandard ; make install 
	git clone https://github.com/kisslinux/kiss.git 2> /dev/null ; cp -r ./kiss $(SRCDIR)
endef

define install
	mkdir -p $(BINDIR) $(SRCDIR)
	mkdir -p $(SRCDIR)/lib/bash $(SRCDIR)/conf $(SRCDIR)/bin
	mkdir -p $(SRCDIR)/lang
	install -m 755 ./src/bchacktool.sh $(BINDIR)/bchacktool3
	install ./lib/*.sh $(SRCDIR)/lib/bash
	install ./conf/* $(SRCDIR)/conf
	install -m 755 ./src/sysfetch.sh $(SRCDIR)/bin/sysfetch
	install -m 755 ./src/sudo.sh $(SRCDIR)/bin/sudo
	ln -s $(SRCDIR)/kiss/kiss $(SRCDIR)/bin/kiss
	$(sub)
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