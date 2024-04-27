export NAME="zphisher"

export SRC=(
    "github.com"    # provider
    "htr-tech"      # maintainer
    "${NAME}"      # repo
)

export ENTRYPOINT="${PROOT}/zphisher.sh:zphisher" # exec <tool>

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "coreutils"
        "curl"
        "tar"
        "php"
        "unzip"
    )

    export COMMANDS=(
        "timeout"
        "cat"
        "rm"
        "curl"
        "tar"
        "php"
        "unzip"
    )
}
