export NAME="SpamWa"

export SRC=(
    "github.com"    # provider
    "krypton-byte"  # maintainer
    "${NAME}"        # repo
)

export ENTRYPOINT="${PROOT}/spam.py:spamwa" # exec <tool>

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "python3"
        "python3-pip"
    )

    export COMMANDS=(
        "python3"
        "pip3"
    )

    tool.debian.setup.exec() {
        pip3 install "requests"
    }
}
