#!/bin/bash

#    Security Tool Kit written in bash 5.14 - ByCh4n's multi Hack Tool kit 
#    Copyright (C) 2022  ByCh4n
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

# Contributors:
#       ByCh4n
#       lazypwny751

set -e
shopt -s expand_aliases

# Pre variables:
export project="bchacktool3"
export ROOT="" PREFIX="/usr"
export CWD="${PWD}" SRCDIR="${ROOT}${PREFIX}/share/${project}"

readonly project SRCDIR

# Sourcing the libraries:
if command -v "requiresh" &> /dev/null ; then
    export REQUIRESH_LIBDIR="${SRCDIR}/lib/bash:$(requiresh --path)"
    source requiresh "os" "userinterface"
else
    echo "\t${BASH_SOURCE[0]}: fatal: 'requiresh' cannot be called."
    exit 1
fi

# Pre check:
os:check:have --command "make" "git" "man"

export DO="shell" version="3.2.0" 

while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        --[lL][aA][gG][uU][aA][gG][eE]|-[lL])
            shift
        ;;
        --[hH][eE][lL][pP]|-[hH])
            shift
            export DO="help"
        ;;
        --[vV][eE][rR][sS][iI][oO][nN]|-[vV])
            shift
            export DO="version"
        ;;
        *)
            shift
        ;;
    esac
done

case "${DO}" in
    shell)
        bash --rcfile "${SRCDIR}/conf/bashrc"
    ;;
    help)
        echo -e "this helper text"
    ;;
    version)
        echo "${version}"
    ;;
    *)
        userinterface:output --error --text "There is no job for -> '${DO}'."
        exit 1
    ;;
esac