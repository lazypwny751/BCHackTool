#!/bin/bash

set -e

export CWD="${PWD}" status="true"
export mlpd="${CWD}/local/script"
export locals=(
	"${CWD}/local/tr.sh"
	"${CWD}/local/fr.sh"
	"${CWD}/local/az.sh"
)

if [[ -d "${CWD}/bin" ]] ; then
	export PATH="${PATH}:${CWD}/bin"
else
	echo "${0##*/}: can't find directory: \"bin\""
	exit 1
fi

requirus.sh --command "mkdir"

if [[ -d "${mlpd}" ]] ; then
	rm -rf "${mlpd}"
fi

mkdir -p "${mlpd}"

mlp-codegen.sh --path "${mlpd}" "${locals[@]}"
