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

# -*-*- Main -*-*-
export OPTION="shell" OPT=()

## Parameter parser
while (( "${#}" > 0 )) ; do
    case "${1,,}" in
        *)
            shift
        ;;
    esac
done

case "${OPTION,,}" in
    "shell")
        bc.shell # options?
    ;;
    *)
        :
    ;;
esac