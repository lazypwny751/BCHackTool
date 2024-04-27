export NAME="TheFatRat"

export SRC=(
    "github.com"    # provider
    "screetsec"     # maintainer
    "${NAME}"     # repo
)

export ENTRYPOINT="${PROOT}/fatrat:fatrat" # exec <tool>

tool.wrapper() {
    export USE="false"
}

# i can't resolve the requirements in this time
# if anyone does this, please open a PR.
tool.debian.setup() {
    export PACKAGES=(
        "default-jdk"
    )

    tool.debian.setup.exec() {
        cd "${PROOT}"
        sudo bash "setup.sh"
    }
}
