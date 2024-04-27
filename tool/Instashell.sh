export NAME="instashell"

export SRC=(
    "github.com"    # provider
    "maxrooted"     # maintainer
    "${NAME}"    # repo
)

export ENTRYPOINT="${PROOT}/instashell.sh:instashell" # exec <tool>

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "coreutils"
        "tor"
        "openssl"
        "curl"
    )

    export COMMANDS=(
        "tor"
        "openssl"
        "curl"
        "chmod"
    )

    tool.debian.setup.exec() {
        cd "${PROOT}"
        sudo bash "${PROOT}/install.sh"
    }
}
