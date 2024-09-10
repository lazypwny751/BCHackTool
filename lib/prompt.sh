bc.prompt() {
    case "${1}" in
        *)
            printf "${lightgreen}╭─ ${2:-"bchacktool ${version[0]}"}${tp} $([[ -n "${_settool}" ]] && { printf "> ${cyan}${_settool}${tp}" ; })\n${lightgreen}╰─▶ ${tp}"
        ;;
    esac
}