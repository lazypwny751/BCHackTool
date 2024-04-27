#!/bin/bash

libt.getfiles() {
    if [[ -d "${1}" ]] ; then
        local ta=() c="0"
        for t in "${1}/"*".sh" ; do
            echo "${t}"
        done
    fi
}

libt.parsetool() {
    local e t
    for e in "${@}" ; do
        t="${e##*/}"
        echo "${t%%.*}"
    done
}