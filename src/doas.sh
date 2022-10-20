#!/bin/bash

# Çok yakında..

export DO="exec"

while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        *)
            shift
        ;;
    esac
done

case "${1}" in
    *)
        echo -e "doas wrapper from bchacktool by lazypwny751."
        exit 0
    ;;
esac