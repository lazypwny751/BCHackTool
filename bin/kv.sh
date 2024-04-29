#!/bin/bash

# Temporary KV storage manager

set -e

unset OPT
export STORAGED="${HOME:-"."}/.config/bckvsh" DATABASE="test" status="true"

./bin/requirus.sh --command "cat" "mkdir" "rm"

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
    #   GET, PUT, DEL, CHK, CDB, ADD, LST
    export req="${o%%:*}"
    export dat="${o##*:}"
    export key="${dat%%=*}"
    export val="${dat##*=}"
    case "${req^^}" in
        "GET")
            # Get value of a key
            if "${status}" && [[ -f "${STORAGED}/${DATABASE}/${key}" ]] ; then
                cat "${STORAGED}/${DATABASE}/${key}"
            else
                echo "${0##*/}: can't read, is it exists?: \"${key}\""
                export status="false"
            fi
        ;;
        "PUT")
            # Overwrite a key
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
            # Delete a key
            if "${status}" && [[ -f "${STORAGED}/${DATABASE}/${key}" ]] ; then
                rm "${STORAGED}/${DATABASE}/${key}" || {
                    export status="false"
                }
            else
                echo "${0##*/}: doesn't exists, so already removed: \"${key}\""
            fi
        ;;
        "CHK")
            # Check Key is a regular file
            if "${status}" && [[ -f "${STORAGED}/${DATABASE}/${key}" ]] ; then
                echo "${key}"
            fi
        ;;
        "CDB")
            # Check Database, this field is different from others
            if "${status}" && [[ -d "${STORAGED}/${key}" ]] ; then
                echo "${DATABASE}"
            fi
        ;;
        "ADD")
            # Add is like PUT, but it's not overwrites
            if "${status}" && [[ -d "${STORAGED}/${DATABASE}" ]] ; then
                echo "${val}" >> "${STORAGED}/${DATABASE}/${key}" || {
                    export status="false"
                }
            else
                echo "${0##*/}: failure on write: \"${key}\""
                export status="false"
            fi
        ;;
        "LST")
            if "${status}" && [[ -d "${STORAGED}/${DATABASE}" ]] ; then
                for k in "${STORAGED}/${DATABASE}/"* ; do
                    if [[ -f "${k}" ]] ; then
                        echo "${k##*/}"
                    fi
                done
            else
                echo "${0##*/}: failure on read database: \"${DATABASE}\""
                export status="false"
            fi
        ;;
    esac

    if ! "${status}" ; then
        exit 1
    fi
done