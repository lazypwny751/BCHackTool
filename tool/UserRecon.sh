export NAME="userrecon"

export SRC=(
    "github.com"    # provider
    "wishihab"      # maintainer
    "${NAME}"     # repo
)

export ENTRYPOINT="${PROOT}/userrecon.sh:userrecon" # exec <tool>

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "grep"
        "curl"
    )

    export COMMANDS=(
        "grep"
        "curl"
    )
}
