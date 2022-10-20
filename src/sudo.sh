#!/bin/bash

# This wrapper doesn't keep the environments
# just execute the primary path staffs as root.

sudo:exist() (
    export PATH="${PATH//"${SRCDIR}/bin:"/}"
    if command -v "sudo" &> /dev/null ; then
        exit 0
    else
        exit 1
    fi
)

export DO="exec" OPTARG=()

while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        --[eE][xX][iI][sS][tT]|-[eE])
            shift
            export DO="check"
        ;;
        --[rR][uU][nN]|--[eE][xX][eE][cC]|-[rR])
            shift
            export DO="exec"
        ;;
        *)
            export OPTARG+=("${1}")
            shift
        ;;
    esac
done

case "${DO}" in
    check)
        if sudo:exist ; then
            exit 0
        else
            exit 1
        fi
    ;;
    exec)
        # There is no alias and function support.
        if sudo:exist ; then
            if command -v "${OPTARG[0]}" &> /dev/null ; then
                export command="$(command -v ${OPTARG[0]})"
                (
                    export PATH="${PATH//"${SRCDIR}/bin:"/}"
                    exec sudo "${command}" "${OPTARG[@]:1}"
                )
            else
                echo "command not found: '${OPTARG[0]:-"NULL"}'."
                exit 1
            fi
        else
            echo "sudo not found!"
            exit 1
        fi
    ;;
    *)
        echo -e "sudo wrapper from bchacktool by lazypwny751."
        exit 0
    ;;
esac