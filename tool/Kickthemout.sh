export NAME="kickthemout"

export SRC=(
	"github.com"	# provider
	"k4m4"			# maintainer
	"${NAME}"	# repo
)

export ENTRYPOINT="${PROOT}/kickthemout.py:kickthemout" # exec <tool>

tool.wrapper() {
	export USE="false"
}

tool.debian.setup() {
	export PACKAGES=(
		"nmap"
		"python3"
		"python3-pip"
	)

	export COMMANDS=(
		"nmap"
		"python3"
		"pip3"
	)

	tool.debian.setup.exec() {
		cd "${PROOT}"
		pip3 install -r "requirements.txt"
	}
}
