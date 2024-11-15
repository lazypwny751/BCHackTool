#!/bin/bash

# Package Manager Wrapper.

set -e

export OPERATION="help" BASE="unknown" PACKAGES=()

# Get operating system base.
base() {
	# Look /etc/os-release
	# Look binary names with configuration files.
	:
}


# Base distributions.
## Debian package manager wrapper.
debian() {
	:
}

# Arch linux package manager wrapper.
arch() {
	:
}

# Fedora pacakge manager wrapper.
fedora() {
	:
}

# Option parser.
while (( "${#}" > 0 )) ; do
	case "${1,,}" in
		"--base"|"-b")
			export OPERATION="base"
			shift
		;;
		*)
			export PACKAGES+=("${1}")
			shift
		;;
	esac
done

# Operation.
case "${OPERATION}" in
	"base")
		echo "${BASE}"
	;;
	"install")
		:
	;;
	"uninstall")
		:
	;;
	"help"|*)
		echo "help text."
	;;	
esac
