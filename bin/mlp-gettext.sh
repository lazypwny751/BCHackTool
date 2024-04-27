#!/bin/bash

# Multi Language Processor - Execute a Language Script
#   git clone https://github.com/erkin/ponysay

set -e

unset OPT OUTD MLANG
export status="true"

requirus.sh --command "bash" # in the PATH?

while (( "${#}" > 0 )) ; do
    case "${1,,}" in
        "--path")
            shift
            if [[ -n "${1}" ]] ; then
                export OUTD="${1}"
                shift
            fi
        ;;
        "--language")
            shift
            if [[ -n "${1}" ]] ; then
                export MLANG="${1}"
                shift
            fi
        ;;
        *)
            export OPT+=("${1}")
            shift
        ;;
    esac
done

if [[ -f "${OUTD}/alias.sh" ]] ; then
    source "${OUTD}/alias.sh"
    for a in "${ALIAS[@]}" ; do
        if [[ "${MLANG}" == "${a%%:*}" ]] ; then
            export mlfile="${a##*:}"
            break
        fi
    done

    if [[ -n "${mlfile}" ]] ; then
        for i in "${OPT[@]}" ; do
            bash "${mlfile}" "${i}"
        done
    else
        for i in "${OPT[@]}" ; do
            printf "${i}"
        done
    fi
else
    echo "${0##*/}: \"alias\" file not found, did you initialize the local with \"mlp-codegen\"?"
    exit 1
fi