export NAME="Cam-Hackers"

export SRC=(
    "github.com"        # provider
    "AngelSecurityTeam" # maintainer
    "${NAME}"       # repo
)

export ENTRYPOINT="${PROOT}/cam-hackers.py:cam-hackers" # exec <tool>

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
        pip3 install -r "requirements.txt"
    }
}
