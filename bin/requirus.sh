#!/bin/bash

set -e

# Check binaries or source libraires
unset DO OPT
export status="true"

while (( "${#}" > 0 )) ; do
    case "${1,,}" in
        "--library")
            export DO="library"
            shift
            if [[ -n "${1}" ]] ; then
                export LIBD="${1}"
                shift
            fi
        ;;
        "--command")
            export DO="command"
            shift
        ;;
        *)
            export OPT+=("${1}")
            shift
        ;;
    esac
done

# for reason to transform lowercase, i don't trust anything is here
case "${DO,,}" in
    "command")
        for c in "${OPT[@]}" ; do
            if ! command -v "${c}" &> /dev/null ; then
                echo -e "${0##*/}: command not found: ${c}"
                export status="false"
            fi
        done

        if ! "${status}" ; then
            exit 1
        fi
    ;;
    "library")
        if [[ -d "${LIBD}" ]] ; then
            for f in "${OPT[@]}" ; do
                if [[ -f "${LIBD}/${f}" ]] ; then
                    if "${status}" ; then
                        source "${LIBD}/${f}"
                    fi
                else
                    echo "${0##*/}: can't find the library: ${LIBD}/${f}"
                    export status="false"
                fi
            done
        else
            echo "${0##*/}: search directory not found: ${LIBD}"
            export status="false"
        fi

        if ! "${status}" ; then
            exit 1
        fi
    ;;
    *)
        echo -e "usage for ${0##*/}:
\tsource ${0##*/} --library <directory> <lib> <lib>
\t${0##*/} --command <cmd> <cmd>
"
    ;;
esac