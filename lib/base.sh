alias bc.gettext='mlp-gettext.sh --path "${MLD}" --language "${BCLANG}"'

version=(
	"3"
	"2"
	"0"
)

bc.shell() {
    bc.shell.listtools() {
        # List tools
        local _c="0" # counter
        for tool in "${TOOLLIST[@]}" ; do
            (( _c += 1 ))
            if (( "${_c}" % 2 != 0 )) ; then
               printf "${lightcyan}[${tp}${_c}${lightcyan}]${tp} ${yellow}${tool}${tp}\t\t"
            else
               printf "${lightcyan}[${tp}${_c}${lightcyan}]${tp} ${yellow}${tool}${tp}\n"
            fi
        done
        printf "\n"
    }

    # Default variables
    local status="true" setprompt="default" setbanner="default"

    # Parameter parser
    while (( "${#}" > 0 )) ; do
        case "${1,,}" in
            "--prompt")
                shift
                if [[ -n "${1}" ]] ; then
                    local setprompt="${1}"
                fi
            ;;
            "--banner")
                shift
                if [[ -n "${1}" ]] ; then
                    local setbanner="${1}"
                fi
            ;;
            *)
                shift
            ;;
        esac
    done

    # Read TOOL list from tool directory.
    readarray -t TOOLLIST < <(libt.parsetool $(libt.getfiles "${BCTOOLD}"))

    # Showup first time banner
    if ! "${showbanneralways:-"false"}" && [[ "${setbanner,,}" == "random" ]] ; then
        bc.banner.rand
    elif ! "${showbanneralways:-"false"}" ; then
        bc.banner "${setbanner}"
    fi

    bc.credits
    bc.shell.listtools

    unset _settool

    # Main loop for interactive shell
    while "${status}"; do
        if [[ -n "${_settool}" ]] ; then
            if [[ -f "${BCTPATH}/tool/${_settool}.sh" ]] ; then
                echo "${_settool}.sh var"
            else
                :
            fi
        fi

        # Show banner
        if "${showbanneralways:-"false"}" || "${showbanner:-"false"}" ; then
            if [[ "${setbanner,,}" == "random" ]] ; then
                bc.banner.rand
            else
                bc.banner "${setbanner}"
            fi
            if ! "${showbanneralways:-"false"}" ; then
                unset showbanner
            fi
        fi

        # Prompt
        bc.prompt "${setprompt:-"default"}" 
        read ropt

        case "${ropt,,}" in
            "$(bc.gettext "banner")"|"b")
                local showbanner="true"
            ;;
            "$(bc.gettext "clear")"|"$(bc.gettext "cls")"|"c")
                clear
            ;;
            "$(bc.gettext "exit")"|"$(bc.gettext "quit")"|"e"|"q")
                quit "none"
                local status="false"
            ;;
            "$(bc.gettext "show")"|"$(bc.gettext "show options")"|"$(bc.gettext "show opt")"|"s")
                echo -e "Tool - ${_settool:-"none"}"
            ;;
            "$(bc.gettext "list")"|"$(bc.gettext "list tools")"|"$(bc.gettext "tool")"|"$(bc.gettext "tools")"|"l")
                bc.shell.listtools
            ;;
            *)
                if bc.isnumber "${ropt}" && (( "${ropt}" > 0 && "${ropt}" <= "${#TOOLLIST[@]}" )) ; then
                    export _settool="${TOOLLIST[((ropt - 1))]}"
                elif [[ "${ropt}" != "" ]] && ! bc.isnumber ; then
                    local _foundTool="false"
                    for t in "${TOOLLIST[@]}" ; do
                        if [[ "${ropt,,}" == "${t,,}" ]] ; then
                            local _foundTool="true"
                            export _settool="${t}" 
                        fi
                    done

                    if ! "${_foundTool}" ; then
                        echo -e "$(bc.gettext "There is no tool or command called like as:") \"${ropt,,}\""
                    fi
                else
                    echo -e "$(bc.gettext "There is no tool or command called like as:") \"${ropt,,}\""
                fi
            ;;
        esac
    done
}