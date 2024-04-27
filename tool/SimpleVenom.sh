export NAME="SimpleVenom"

export SRC=(
    "github.com"    # provider
    "ByCh4n"        # maintainer
    "${NAME}"   # repo
)

export ENTRYPOINT="${PROOT}/simplevenom.sh:simplevenom" # exec <tool>
export REQUIREROOT="true"

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "zenity"
        "sudo"
    )

    export COMMANDS=(
        "zenity"
        "sudo"
        "msfconsole"
    )
}
