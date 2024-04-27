export NAME="OSIF"

export SRC=(
    "github.com"    # provider
    "CiKu370"       # maintainer
    "${NAME}"          # repo
)

export ENTRYPOINT="${PROOT}/osif.py:osif" # exec <tool>

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "python2.7"
        "python-pip"
    )

    export COMMANDS=(
        "python2.7"
        "pip2"
    )

    tool.debian.setup.exec() {
        pip2 install -r "requirements.txt"
    }
}
