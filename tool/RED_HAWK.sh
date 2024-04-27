export NAME="RED_HAWK"

export SRC=(
    "github.com"    # provider
    "Tuhinshubhra"  # maintainer
    "${NAME}"      # repo
)

export ENTRYPOINT="${PROOT}/rhawk.php:rhawk" # exec <tool>
export INTERPRETER="php"

tool.wrapper() {
    export USE="false"
}

tool.debian.setup() {
    export PACKAGES=(
        "php"
        "php-curl"
        "php-xml"
    )

    export COMMANDS=(
        "php"
    )
}
