SRC := bchacktool.sh
PREFIX := /usr
BINDIR := $(PREFIX)/bin
BINPTH := $(BINDIR)/bchacktool

all: setup_root install
setup_root:
	mkdir -vp $(BINDIR)

install:
	install -vm 755 $(SRC) $(BINPTH)

remove:
	rm -v $(BINPTH)

.PHONY: all setup_root install remove
