#!/bin/bash

set -e

# Color Palet
export cyan="\e[0;36m"
export lcyan="\e[96m"
export lgreen="\e[1;32m"
export white='\e[1;37m'
export red="\e[1;31m"
export yellow="\e[1;33m"
export blue="\e[1;34m"
export green="\e[0;32m"
export reset="\e[0m"

# Defaults
export SETOPTION="unknown"
export SOURCE="https://raw.githubusercontent.com/lazypwny751/BCHackTool/refs/heads/master/tool"
export BCROOT="${HOME:-.}/.bychan"
export version=(
	"3"
	"2"
	"0"
)

## Command Package
export REQ_COMMANDS=(
	"git:git"
	"curl:curl"
	"rm:coreutils"
	"cat:coreutils"
	"mkdir:coreutils"
)
export OPT=() 

# Functions
## Basics.
function die {
	local MSG="${1:-Unknown}"
	printf "${0##*/}: ${red}fatal${reset}: ${MSG^^}.\n"
	exit "${2:-1}"
}

function warn {
	local MSG="${1:-Unknown}"
	printf "${0##*/}: ${yellow}warning${reset}: ${MSG^}.\n"
	return "${2:-0}"
}

function info {
	local MSG="${1:-Unknown}"
	printf "${0##*/}: ${blue}info${reset}: ${MSG^}.\n"
	return "0"
}

function err {
	local MSG="${1:-Unknown}"
	printf "${0##*/}: ${red}error${reset}: ${MSG^}.\n"
	return "${2:-1}"
}

function success {
	local MSG="${1:-Unknown}"
	printf "${0##*/}: ${green}success${reset}: ${MSG^}.\n"
	return "0"
}

function handle_exit {
	# For now it just gives an exit message but with time it will make secure exit for the tool.
	local msg=(
		"Byee.."
		"See yea again."
		"A bientot!"
		"Au revoir!"
		"It’s a beautiful day to compile. CPUs are running, fans are spinning..."
		"Nyeh heh heh!"
		"Salamat qal."
		"Yenə görüşək."
	)
	printf "${msg[$(( RANDOM % ${#msg[@]} ))]}\n"
}

function banner {
	printf " ______         ______ __                
|   __ \.--.--.|      |  |--.---.-.-----.
|   __ <|  |  ||   ---|     |  _  |     |
|______/|___  ||______|__|__|___._|__|__|
        |_____|\n"
}

## Command Package
function require {
	local cmd="" status="true" counter="0"

	for cmd in "${@}"
	do
		if ! command -v "${cmd%%:*}" &> /dev/null
		then
			warn "missing: \"${cmd%%:*}\", but you can find it at: \"${cmd##*:}\""
			local status="false"
			local counter="$(( counter + 1 ))"
		fi
	done

	if ! "${status}"
	then
		err "there's \"${counter}\" missing command"
	fi
}

function arr2ver {
	local MAJOR="${1:-0}"
	local MINOR="${2:-0}"
	local PATCH="${3:-0}"
	local VERSION=("${MAJOR}" "${MINOR}" "${PATCH}")
	local v="" counter="0"
	for v in "${VERSION[@]}"
	do
		local counter="$(( counter + 1 ))"
		if (( "${counter}" > 0 && "${counter}" < "${#VERSION[@]}" ))
		then
			printf "${v}."
		else
			printf "${v}"
		fi
	done
}

function ver2arr {
	local VERSION="${1:-0.0.0}"
	local v="" IFS="." counter="0"
	for v in ${VERSION}
	do
		local counter="$(( counter + 1 ))"
		if (( "${counter}" > 0 && "${counter}" < 3))
		then
			printf "\"${v}\" "
		else
			printf "\"${v}\""
			break
		fi
	done
}

## Sub Functions
function bc:nuke {
	if [[ -d "${BCROOT}" ]]
	then
		rm -vrf "${BCROOT}" && {
		printf "	⣀⣀⣀
⠀⠀⠀⠀⣠⡴⢾⠅⠀⠀⠀⠉⠁⠉⠉⠰⡤⢀⠀⠀⠀
⠀⢀⠖⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡷⡀⠀
⠀⢞⢆⠀⠀⠀⠀⠀⠀⣀⠀⡀⠀⠀⠀⠀⠀⠀⠀⢧⠀
⠀⠀⠫⢄⣠⣤⣄⣤⣿⠛⠟⠻⢻⣿⣆⠀⢀⣠⣤⠞⠀
⠀⠀⠀⠀⠈⠉⠉⠛⢻⠀⠀⠀⢸⠿⠛⠛⠋⠉⠁⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣀⠽⡀⡀⣰⠸⢤⣀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢰⡊⠀⠀⡀⢀⡁⣀⣀⠀⠀⣼⠆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠙⠛⢻⢹⠋⡋⣿⠛⠉⠁⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡀⠤⠀⣰⣞⠸⠀⠇⢸⠖⡐⠄⠀⠀⠀⠀⠀
⠀⣀⣴⣾⣿⣿⣾⣠⣏⠀⡤⣠⡈⢧⣝⣷⣶⣄⡀⠀⠀
⠈⠀⠁⠈⠙⠹⠿⠿⠷⠻⡿⣿⠿⠿⠿⠻⠻⠯⠻⠖⡆\n"	
		} || {
			die "problem occured while removing \"${BCROOT}\" directory"
		}
	fi
}

function bc:setup:bcroot {
	require "mkdir:coreutils" "rm:coreutils"
	[[ -z "${BCROOT}" ]] && export BCROOT="${HOME:-.}/.bychan"
	if [[ ! -d "${BCROOT}" ]]
	then
		mkdir -p "${BCROOT}"
	fi
}

function bc:gensc {
	if (( "${#}" == 2 ))
	then
		local SOURCEDIR="${1}"
		local SOURCEFILE="${SOURCEDIR}/${2}"
		printf "# This file generated automaticaly by ${0##*/}, please don't change manually.\nunset SOURCE\nexport SOURCE=(\n" > "${SOURCEFILE}"
		if [[ -d "${SOURCEDIR}" ]]
		then
			local f=""
			for f in "${SOURCEDIR}/"*".sh"
			do
				if [[ "${f}" != *"${SOURCEFILE}" ]]
				then
					(
						unset NAME VERSION
						source "${f}"
						if [[ -n "${NAME}" && -n "${VERSION}" ]]
						then
							printf "\t\"${NAME}:$(arr2ver ${VERSION[0]} ${VERSION[1]} ${VERSION[2]}):${f##*/}\"\n" >> "${SOURCEFILE}"
							info "${NAME} -> ${SOURCEFILE##*/}"
						else
							warn "the file \"${f}\" doesn't contain 'NAME' or 'VERSION' variables"
						fi
					)
				fi
			done
			printf ")\n" >> "${SOURCEFILE}"
		else
			err "\"${SOURCEDIR}\" doesn't exist."
		fi
	else
		die "insufficient parameters"
	fi
}

while (( "${#}" > 0 ))
do
	case "${1,,}"
	in
		("--shell"|"-s")
			shift
			export SETOPTION="shell"
		;;
		("--version"|"-v")
			shift
			export SETOPTION="version"
		;;
		("--help"|"-h")
			shift
			export SETOPTION="help"
		;;
		("--gensc"|"-g")
			# Generate Source.
			shift
			export SETOPTION="generatesource"
			if [[ -n "${1}" && "${1}" != -* ]]
			then
				export SOURCEDIR="${1}"
			else
				export SOURCEDIR="tool"
			fi
		;;
		("--banner"|"-b")
			shift
			export banner="true"
		;;
		(*)
			export OPT+=("${1}")
			shift
		;;
	esac
done

case "${SETOPTION,,}"
in
	("shell")
		trap handle_exit EXIT INT
		require "${REQ_COMMANDS[@]}"
		( "${banner:-false}" && banner || exit 0 )
		# Here we got interactive shell.
	;;
	("generatesource")
		bc:gensc "${SOURCEDIR:-tool}" "${SOURCEFILE:-source.sh}"
	;;
	("version")
		arr2ver "${version[0]}" "${version[1]}" "${version[2]}"
		printf "\n"
		exit 0
	;;
	("help")
		( "${banner:-false}" && banner || exit 0 )
		printf "Long help\n"
	;;
	(*)
		printf "Short help\n"
	;;
esac
