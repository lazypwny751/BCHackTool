#!/bin/bash

unset OPTS SETOPT
export status="true"

requirus.sh --command "git" "kv.sh"

bspm.init() {
    :
}

while (( "${#}" > 0 )) ; do
    case "${1}" in
        *)
            OPTS+=("${1}")
            shift
        ;;
    esac
done

case "${SETOPT}" in
    *)
        :
    ;;
esac