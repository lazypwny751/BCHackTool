PREFIX := /usr
BINDIR := $(PREFIX)/bin
SHRDIR := $(PREFIX)/share/bchacktool

all: doctor build install

doctor:
	@echo "bchacktool doctor check-up.."

build:
	cargo build

install:

clean:
	cargo clean
	rm Cargo.lock

.PHONY: doctor all build install
