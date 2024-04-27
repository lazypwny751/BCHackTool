export NAME="cupp"
export SRC=(
    "github.com"    # provider
    "Mebus"         # maintainer
    "${NAME}"		# repo
)

export ENTRYPOINT="${PROOT}/cupp.py:cupp" # exec <tool>
export EXECPARAMS=(
    "-i"
)

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "python3"
    )

    export COMMANDS=(
        "python3"
    )
}
