#!/bin/bash

#    Security Tool Kit written in bash 5.14 - ByCh4n's multi Hack Tool kit 
#    Copyright (C) 2023  ByCh4n & lazypwny751
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

# shellcheck source=/dev/null

# Configuring Settings the variables
set -e
shopt -s expand_aliases

export status="true" option="shell" CWD="${PWD}"
ENTITIES=(
    "${CWD}/language"
    "${CWD}/language/mlp.awk"
    "${CWD}/tools"
    "${CWD}/tools/bchelper.sh"
)

COMMANDS=(
    "ln"
    "rm"
    "awk"
    "git"
    "mkdir"
)

readonly CWD

# Pre functions
check:cmd() {
    local status="true" i=""

    for i in "${@}" ; do
        if command -v "${i}" &> /dev/null ; then
            echo -e "\t${0##*/}: \"${i}\" doesn't exist!"
            local status="false"
        fi
    done

    if ! ${status} ; then
        return 1
    fi
}

mlp:echo() {
    # Multi Language Processor
    local DEFAULT="${LANG%.*}"
    local DEFAULT="${DEFAULT%_*}"

    if [[ -z "${SETLANG}" ]] ; then
        export SETLANG="${DEFAULT}"
    fi

    if [[ -f "${CWD}/language/language.${SETLANG,,}" ]] ; then
        awk -v opt="${1}" -f "${CWD}/language/mlp.awk" "${CWD}/language/language.${SETLANG,,}"
    else
        echo -e "\tthere is no support for ${SETLANG}, but for now, You can commit to our project to support us."
        return 1
    fi
}

# ByCh4n Core Functions

bc:_init_() {
    # Entity controller
    local i="" status="true"
    for i in "${ENTITIES[@]}" ; do
        if ! [[ -e "${i}" ]] ; then
            echo -e "\tfile or directory \"${i##*/}\" doesn't exist"
            status="false"
        fi
    done

    local i=""

    # Binary controller
    for i in "${COMMANDS[@]}" ; do
        if ! command -v "${i}" &> /dev/null ; then
            echo -e "\t command not found required as \"${i}\""
            status="false"
        fi
    done

    if ! ${status} ; then
        return 1
    fi

    # Sourcing tool manager functions
    source "${CWD}/tools/bchelper.sh"

    # Load a lang (burada apt'ye küçük bir gönderme var).
    if ! [[ "${1,,}" == "silent" ]] ; then
        mlp:echo "hello world"
    fi
}

bc:oscom() {
    # Operating System Communicator
    :
}

bc:fakeenv() {
    # Fake environment manager.
    :
}

# Parsing arguments and parameters
while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        --[hH][eE][lL][pP])
            shift
            export option="help"
        ;;
        *)
            shift
        ;;
    esac
done


case "${option}" in
    "shell")
        bc:_init_
    ;;
    "help")
        :
    ;;
    *)
        echo -e "\tthere is no option like \"${option}\"."
        exit 1
    ;;
esac