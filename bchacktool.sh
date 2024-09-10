#!/bin/bash

set -e
shopt -s expand_aliases

export BCTPATH="$(realpath "$(dirname "${0}")")"
export PATH="${PATH}:${BCTPATH}/bin"
export MLD="${BCTPATH}/local/script" BCTOOLD="${BCTPATH}/tool"
export BCLIB=(
    "base.sh"
    "color.sh"
    "banner.sh"
    "libtool.sh"
    "polkish.sh"
    "prompt.sh"
    "utils.sh"
)

[[ ! -x "${BCTPATH}/bin/requirus.sh" ]] && {
    echo "Requirement helper isn't executable, you can try: ~$ chmod u+x bin/requirus.sh"
    exit 1
}

source requirus.sh --library "${BCTPATH}/lib" "${BCLIB[@]}"
requirus.sh --command "mlp-gettext.sh" "git" "bash" "kv.sh" # check bash is in the PATH?
trap quit INT

export OPTION="shell" OPT=()

set +e

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
        "--banner")
            shift
            if [[ -n "${1}" ]] ; then
                case "${1,,}" in
                    "random"|"rand"|"r")
                        export BCBANNER="random"
                    ;; 
                    *)
                        export BCBANNER="${1}"
                    ;;
                esac
                shift
            fi
        ;;
        "--default")
            shift
            if [[ -n "${1}" ]] ; then
                case "${1,,}" in
                    "banner")
                        export showbanneralways="true" 
                    ;;
                esac
            fi
        ;;
        "--version")
            export OPTION="version"
            shift
        ;;
        *)
            shift
        ;;
    esac
done

case "${OPTION,,}" in
    "shell")
        bc.shell --prompt "${BCPROMPT:-"default"}" --banner "${BCBANNER:-"default"}"
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
    "version")
        echo "${version[0]}.${version[1]}.${version[2]}"
    ;;
    *)
        :
    ;;
esac