#!/bin/bash

source requiresh "color" "os" "libsysfetch" "userinterface"

export DO="fetch"

while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        *)
            shift
        ;;
    esac
done

case "${DO}" in
    *)
        userinterface:output --error --text "there is no job like '${DO}'."
    ;;
esac