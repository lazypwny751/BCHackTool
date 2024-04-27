#!/bin/bash

set -e

export CWD="${PWD}" PATH="${PATH}:${PWD}/bin"
export MLD="${CWD}/local/script" BCTOOLD="${CWD}/tool"
export BCLIB=(
    "base.sh"
    "banner.sh"
    "color.sh"
    "libtool.sh"
)

[[ ! -x "${PWD}/bin/requirus.sh" ]] && {
    echo "Requirement helper isn't executable, you can try: ~$ chmod u+x bin/requirus.sh"
    exit 1
}

source requirus.sh --library "${CWD}/lib" "${BCLIB[@]}"
requirus.sh --command "mlp-gettext.sh" "git" "bash" "kv.sh" # check bash is in the PATH?
trap quit INT

export OPTION="shell" OPT=()

while (( "${#}" > 0 )) ; do
    case "${1,,}" in
        "--shell")
            export OPTION="shell"
            shift
        ;;
        "--language")
            shift
            if [[ -n "${1}" ]] ; then
                case "${1,,}" in
                    "list")
                        export OPTION="list languages"
                    ;; 
                    *)
                        export BCLANG="${1}"
                    ;;
                esac
                shift
            fi
        ;;
        *)
            shift
        ;;
    esac
done

case "${OPTION,,}" in
    "shell")
        bc.shell # options?
    ;;
    "list languages")
        for l in "${MLD}/"*".sh" ; do
            l="${l##*/}"
            l="${l%%.*}"
            if [[ "${l}" != "alias" ]] ; then
                echo "${l}"
            fi
        done
    ;;
    *)
        :
    ;;
esac