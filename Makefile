PREFIX := /usr
BINDIR := $(PREFIX)/bin
SHRDIR := $(PREFIX)/share/bchacktool

all: doctor build install

doctor:
	@echo "bchacktool doctor check-up.."

build:
	cargo build

install:

clippy:
	cargo clippy --all-targets --all-features -- -Dwarnings

clean:
	cargo clean
	rm Cargo.lock

.PHONY: all doctor build install clippy clean
