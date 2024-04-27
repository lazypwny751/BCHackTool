export NAME="whoami-project"

export SRC=(
    "github.com"    # provider
    "owerdogan"     # maintainer
    "${NAME}"       # repo
)

export EXEC="kali-whoami"
export EXECPARAMS=(
    "--start"
)

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "tar"
        "tor"
        "curl"
        "python3"
        "python3-scapy"
        "network-manager"
    )

    export COMMANDS=(
        "tar"
        "tor"
        "curl"
        "python3"
    )

    tool.debian.setup.exec() {
        cd "${PROOT}"
        sudo make install
    }
}