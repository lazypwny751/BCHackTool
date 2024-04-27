export NAME="Ghost"

export EXEC="ghost"

tool.debian.setup() {
    export PACKAGES=(
        "python3"
        "python3-pip"
    )

    export COMMANDS=(
        "pip3"
    )

    tool.debian.setup() {
        pip3 install "git+https://github.com/EntySec/Ghost"
    }
}