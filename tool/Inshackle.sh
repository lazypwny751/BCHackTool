export NAME="inshackle-bot"

export SRC=(
	"github.com"	# provider
	"cyberkallan"	# maintainer
	"${NAME}"	# repo
)

export ENTRYPOINT="${PROOT}/inshackle.sh:inshackle" # exec <tool>

tool.wrapper() {
	export USE="false"
}

tool.debian.setup() {
	export PACKAGES=(
		"coreutils"
		"openssl"
		"grep"
		"wget"
	)

	export COMMANDS=(
		"mkdir"
		"cat"
		"cut"
		"cp"
		"rm"
		"openssl"
		"grep"
		"wget"
	)
}
