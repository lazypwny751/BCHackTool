export NAME="IP-Tracer"

export SRC=(
    "github.com"    # provider
    "rajkumardusad" # maintainer
    "${NAME}"     # repo
)

export ENTRYPOINT="${PROOT}/ip-tracer:ip-tracer" # exec <tool>
export EXECPARAMS=(
    "start"
)

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "php"
    )

    export COMMANDS=(
        "php"
    )
}
