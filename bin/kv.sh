#!/bin/bash

# Temporary KV storage manager

set -e

unset OPT
export STORAGED="${HOME:-"."}/.config/bckvsh" DATABASE="test" status="true"

requirus.sh --command "cat" "mkdir" "rm"

while (( "${#}" > 0 )) ; do
    case "${1,,}" in
        "--database")
            shift
            if [[ -d "${1}" ]] ; then
                export DATABASE="${1}"
                shift
            fi
        ;;
        "--path")
            shift
            if [[ -d "${1}" ]] ; then
                export STORAGED="${1}"
                shift
            fi
        ;;
        *)
            export OPT+=("${1}")
            shift
        ;;
    esac
done

if [[ ! -d "${STORAGED}/${DATABASE}" ]] ; then
    mkdir -p "${STORAGED}/${DATABASE}"
fi

for o in "${OPT[@]}" ; do
    # OPT:key=value
    #   GET, PUT, DEL
    # TODO:
    #   CHK, ADD  
    export req="${o%%:*}"
    export dat="${o##*:}"
    export key="${dat%%=*}"
    export val="${dat##*=}"
    case "${req^^}" in
        "GET")
            if "${status}" && [[ -f "${STORAGED}/${DATABASE}/${key}" ]] ; then
                cat "${STORAGED}/${DATABASE}/${key}"
            else
                echo "${0##*/}: can't read, is it exists?: \"${key}\""
                export status="false"
            fi
        ;;
        "PUT")
            if "${status}" && [[ -d "${STORAGED}/${DATABASE}" ]] ; then
                echo "${val}" > "${STORAGED}/${DATABASE}/${key}" || {
                    export status="false"
                }
            else
                echo "${0##*/}: failure on write: \"${key}\""
                export status="false"
            fi
        ;;
        "DEL")
            if "${status}" && [[ -f "${STORAGED}/${DATABASE}/${key}" ]] ; then
                rm "${STORAGED}/${DATABASE}/${key}" || {
                    export status="false"
                }
            else
                echo "${0##*/}: doesn't exists, so already removed: \"${key}\""
            fi
        ;;
    esac

    if ! "${status}" ; then
        exit 1
    fi
done