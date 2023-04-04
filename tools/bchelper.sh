#!/bin/bash

# Metadata Reader and Environment Helper.
# a part of bchacktool.

bchelper:gettool() {
    unset ver repo entrypoint require_debian require_ubuntu require_kali require_fedora require_arch
    local status="true" i="" _repoarr_=() _require_=() _pkgrequirus_=() oscom="$(declare -f bc:oscom)"
    source "${1}"

    for i in "ver" "repo" "entrypoint" ; do
        if [[ -z "${!i}" ]] ; then
            echo -e "${red}$(mlp:echo "required variable doesn't exist, please check the meta file if is it in place or is it misconfigured")${reset}: ${i}"
            local status="false"
        fi
    done

    if ! ${status} ; then
        return 1
    fi

    local repoadr="${repo##*//}"
    read -a _repoarr_ <<< "${repoadr//\//" "}"

    export TOOLDIR="${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}"

    local _require_="require_$(bc:oscom --getbase)"

    if [[ -f "${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}.bcmeta" ]] ; then
        source "${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}.bcmeta"
    else
        (
            echo -e "\t${blue}==>${reset} $(mlp:echo "starting installation")${reset}"

            # Check if there is os depends.
            if [[ -n "${!_require_}" ]] ; then
                case "$(bc:oscom --getbase)" in
                    "debian")
                        local _requirus_=("${require_debian[@]}")
                    ;;
                    "ubuntu")
                        local _requirus_=("${require_ubuntu[@]}")
                    ;;
                    "kali")
                        local _requirus_=("${require_kali[@]}")
                    ;;
                    "fedora")
                        local _requirus_=("${require_fedora[@]}")
                    ;;
                    "arch")
                        local _requirus_=("${require_arch[@]}")
                    ;;
                esac

                # Ah be requirus :D, dwm'ciler anladı diğerleri bu ne aga diyor.
                for i in "${_requirus_[@]}" ; do
                    local _requirusarr_=()
                    read -a _requirusarr_ <<< "${i//":"/" "}" 
                    local _pkgrequirus_+=("${_requirusarr_[0]}")
                done
                echo -e "\t${blue}==>${reset} $(mlp:echo "updating operating system catalogs")"
                (
                    exec "$(bc:oscom --polkit) $(bc:oscom --update)" 
                )
                echo -e "\t${blue}==>${reset} $(mlp:echo "installing dependencies, please be patient")"
                (
                    exec "$(bc:oscom --polkit) $(bc:oscom --install "${_pkgrequirus_[@]}")"
                )
                echo -e "\t${green}==>${reset} $(mlp:echo "dependencies installed")"
            fi

            # Get tool source.
            if ! [[ -d "${CWD}/repo" ]] ; then
                mkdir -p "${CWD}/repo"
            fi

            if ! [[ -d "${CWD}/repo/${_repoarr_[-2]}" ]] ; then
                mkdir -p "${CWD}/repo/${_repoarr_[-2]}"
            fi

            if [[ ! -d "${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}" ]] ; then
                echo -e "\t${blue}==>${reset} $(mlp:echo "getting the tool")"
                git clone "${repo}" "${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}"
            fi

            # Save meta data and link the executable file.
            echo -e "ver=\"${ver}\"" > "${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}.bcmeta"
            if [[ -n "${!_require_}" ]] && [[ -n "${_requirus_[@]}" ]] ; then
                echo -e "requirus=(${_requirus_[@]})" >> "${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}.bcmeta"
            fi

            if ! [[ -d "${CWD}/entrypoints" ]] ; then
                mkdir -p "${CWD}/entrypoints"
            fi

            source "${1}"

            # Link entry point (executable file).
            echo -e "entrypoint=\"${entrypoint[2]}\"\nexec=\"${entrypoint[1]}\"" >> "${CWD}/repo/${_repoarr_[-2]}/${_repoarr_[-1]}.bcmeta"
            case "${entrypoint[0]}" in
                [fF][iI][lL][eE])
                    chmod u+x "${entrypoint[2]}"
                    ln -s "${entrypoint[2]}" "${CWD}/entrypoints/${entrypoint[2]##*/}"
                ;;
            esac
        )
    fi
}

bchelper:exectool() {
    :
}

bchelper:checkin() {
    (
        unset repo
        source "${1}"
        if [[ -n "${repo}" ]] ; then
            export repo="${repo##*//}"
            read -a arrvar <<< "${repo//\//" "}"
            if [[ -f "${CWD}/repo/${arrvar[-2]}/${arrvar[-1]}.bcmeta" ]] ; then
                return 0
            else
                return 1
            fi
        fi
    )
    return "${?}"
}

bchelper:getrepoinfo() {
    (
        unset repo
        source "${1}"
        if [[ -n "${repo}" ]] ; then
            export repo="${repo##*//}"
            read -a arrvar <<< "${repo//\//" "}"
            echo -e "$(mlp:echo "by") ${cyan}${arrvar[-2]}${reset}, ${yellow}${arrvar[-1]}${reset}"
        else
            echo "null"
        fi
    )
}