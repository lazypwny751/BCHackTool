#!/bin/bash

#    Security Tool Kit written in bash 5.1.16 - ByCh4n's multi Hack Tool kit 
#    Copyright (C) 2023  ByCh4n&lazypwny751
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

export status="true" option="shell" version="3.2" CWD="${PWD}" OPTARG=()

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
    "find"
    "mkdir"
)


# Colors
black='\033[0;30m'        # Black
red='\033[0;31m'          # Red
green='\033[0;32m'        # Green
yellow='\033[0;33m'       # Yellow
blue='\033[0;34m'         # Blue
purple='\033[0;35m'       # Purple
cyan='\033[0;36m'         # Cyan
white='\033[0;37m'        # White
reset='\033[0m'           # return 0

readonly CWD

# Pre functions
check:cmd() {
    local status="true" i=""

    for i in "${@}" ; do
        if ! command -v "${i}" &> /dev/null ; then
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
        echo -e "\tthere is no support for \"${SETLANG}\", but for now, You can commit to our project to support us."
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

    if [[ -d "${CWD}/.TMP" ]] ; then
        rm -rf "${CWD}/.TMP"
    fi

    mkdir -p "${CWD}/.TMP"

    # Load a lang (burada apt'ye küçük bir gönderme var).
    if ! [[ "${1,,}" == "silent" ]] ; then
        mlp:echo "hello world"
    fi
}

bc:oscom() {
    local OPTARG=() option="getbase"
    # Operating System Communicator
    while [[ "${#}" -gt 0 ]] ; do
        case "${1}" in
            *)
                local OPTARG+=("${1}")
                shift
            ;;
        esac
    done

    case "${option}" in
        "getbase")
            :
        ;;
        *)
            :
        ;;
    esac
}

bc:fakeenv() {
    # Fake environment manager.
    :
}

bc:banner() {
    # We're using for bannes the https://patorjk.com/software/taag, thanks patorjk.
    local banners=(
        "${red}                                                 
   (    (      )             )  *   )        (   
 ( )\   )\  ( /(    )     ( /(\` )  /(        )\  
 )((_)(((_) )\())( /(  (  )\())( )(_)|    ( ((_) 
((_)_ )\___((_)\ )(_)) )\((_)\(_(_()))\   )\ _   
 | _ |(/ __| |(_|(_)_ ((_) |(_)_   _((_) ((_) |  
 | _ \| (__| ' \/ _\` / _|| / /  | |/ _ \/ _ \ |  
 |___/ \___|_||_\__,_\__||_\_\  |_|\___/\___/_|  
                                                
${reset}"
        "${cyan}
___________________ .__                   __   ___________           .__   
\______   \_   ___ \|  |__ _____    ____ |  | _\__    ___/___   ____ |  |  
 |    |  _/    \  \/|  |   \__  \ _/ ___\|  |/ / |    | /  _ \ /  _ \|  |  
 |    |   \     \___|   Y  \/ __ \   \___|    <  |    |(  <_> |  <_> )  |__
 |______  /\______  /___|  (____  /\___  >__|_ \ |____| \____/ \____/|____/
        \/        \/     \/     \/     \/     \/                           
${reset}"
        "${yellow}
 _____ _____ _           _   _____         _ 
| __  |     | |_ ___ ___| |_|_   _|___ ___| |
| __ -|   --|   | .'|  _| '_| | | | . | . | |
|_____|_____|_|_|__,|___|_,_| |_| |___|___|_|
                                             
${reset}"
        "${green}
 ▄▄▄▄    ▄████▄   ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀▄▄▄█████▓ ▒█████   ▒█████   ██▓    
▓█████▄ ▒██▀ ▀█  ▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓  ██▒ ▓▒▒██▒  ██▒▒██▒  ██▒▓██▒    
▒██▒ ▄██▒▓█    ▄ ▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒ ▓██░ ▒░▒██░  ██▒▒██░  ██▒▒██░    
▒██░█▀  ▒▓▓▄ ▄██▒░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ░ ▓██▓ ░ ▒██   ██░▒██   ██░▒██░    
░▓█  ▀█▓▒ ▓███▀ ░░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄  ▒██▒ ░ ░ ████▓▒░░ ████▓▒░░██████▒
░▒▓███▀▒░ ░▒ ▒  ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒  ▒ ░░   ░ ▒░▒░▒░ ░ ▒░▒░▒░ ░ ▒░▓  ░
▒░▒   ░   ░  ▒    ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░    ░      ░ ▒ ▒░   ░ ▒ ▒░ ░ ░ ▒  ░
 ░    ░ ░         ░  ░░ ░  ░   ▒   ░        ░ ░░ ░   ░      ░ ░ ░ ▒  ░ ░ ░ ▒    ░ ░   
 ░      ░ ░       ░  ░  ░      ░  ░░ ░      ░  ░                ░ ░      ░ ░      ░  ░
      ░ ░                          ░                                                  
${reset}"
        "${cyan}
██████╗  ██████╗██╗  ██╗ █████╗  ██████╗██╗  ██╗████████╗ ██████╗  ██████╗ ██╗     
██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔═══██╗██║     
██████╔╝██║     ███████║███████║██║     █████╔╝    ██║   ██║   ██║██║   ██║██║     
██╔══██╗██║     ██╔══██║██╔══██║██║     ██╔═██╗    ██║   ██║   ██║██║   ██║██║     
██████╔╝╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗   ██║   ╚██████╔╝╚██████╔╝███████╗
╚═════╝  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
${reset}"
    )

    case "${1}" in
        "1")
            echo -e "${banners[$(( ${1} - 1 ))]}"
            # echo -e "${banners[0]}"
        ;;
        "2")
            echo -e "${banners[$(( ${1} - 1 ))]}"
            # echo -e "${banners[1]}"
        ;;
        "3")
            echo -e "${banners[$(( ${1} - 1 ))]}"
            # echo -e "${banners[2]}"
        ;;
        "4")
            echo -e "${banners[$(( ${1} - 1 ))]}"
            # echo -e "${banners[3]}"
        ;;
        "5")
            echo -e "${banners[$(( ${1} - 1 ))]}"
            # echo -e "${banners[4]}"
        ;;
        *)
            echo -e "${banners[$(( ${RANDOM} % ${#banners[@]}))]}"
        ;;
    esac
}

bc:getlangnames() {
    local setlocals=()
    while IFS="" read -r -d $'\0' ; do
        setlocals+=("${REPLY}")
    done < <(find "${CWD}/language" -name language.* -print0)

    local i=""

    for i in "${setlocals[@]}" ; do
        local setlang="${i##*/}"
        echo "${setlang##*.}"
    done
}

bc:listitems() {
    local setitems=()
    while IFS="" read -r -d $'\0' ; do
        setitems+=("${REPLY}")
    done < <(find "${CWD}/tools" -name *.meta -print0)

    local i="" toolcounter="0"

    for i in "${setitems[@]}" ; do
        local settool="${i##*/}"
        local settool="${settool%.*}"
        echo -e "\t${cyan}${settool}${reset}"
        local toolcounter="$(( ${toolcounter} + 1 ))"
    done
    echo -e "${blue}$(mlp:echo "total tools") ${toolcounter}${reset}"
}

bc:cleanexit() {
    if [[ -d "${CWD}/.TMP" ]] ; then
        rm -rf "${CWD}/.TMP" 2> /dev/null
    fi

    exit 0
}

# Parsing arguments and parameters
while [[ "${#}" -gt 0 ]] ; do
    case "${1}" in
        --[hH][eE][lL][pP])
            export option="help"
            shift
        ;;
        *)
            export OPTARG+=("${1}")
            shift
        ;;
    esac
done

# Options
case "${option}" in
    "shell")
        bc:_init_
        bc:banner "random"
        echo -e "${yellow}$(mlp:echo "listing tools, don't forget you can choise tool you want with select command")${reset}"
        bc:listitems
        while true ; do
            read -p "bchacktool[${version}]:> " main
            read -a param <<< "${main}"
            export param
            case "${main}" in
                [sS][eE][lL][eE][cC][tT]*)
                    if [[ -f "${CWD}/tools/${param[1]}.meta" ]] ; then
                        export setmetafile="${CWD}/tools/${param[1]}.meta"
                        (
                            set +e
                            ls "${setmetafile}"
                        )
                    else
                        echo -e "${red}$(mlp:echo "the tool doesn't exist") ${yellow}${param[1]}${reset}"
                    fi
                ;;
                [lL][iI][sS][tT]|[tT][oO][oO][lL][sS])
                    echo -e "${yellow}$(mlp:echo "listing tools, don't forget you can choise tool you want with select command")${reset}"
                    bc:listitems
                ;;
                [uU][pP][dD][aA][tT][eE]|[uU][pP])
                    echo -e "${blue}$(mlp:echo "updating tool self")${reset}"
                    (
                        if [[ -d "${0##*/}" ]] ; then
                            cd "${0##*/}"
                        fi
                        git pull
                    ) && { 
                        echo -e "${green}$(mlp:echo "updated successfully")${reset}"
                    } || {
                        echo -e "${red}$(mlp:echo "failed to update")${reset}"
                        exit 1
                    }
                ;;
                [lL][aA][nN][gG][uU][aA][gG][eE]|[lL][aA][nN][gG])
                    PS3="$(mlp:echo "please select your language")"
                    export langcounter="0"
                    select lang in $(bc:getlangnames) ; do
                        if [[ -f "${CWD}/language/language.${lang}" ]] ; then
                            export SETLANG="${lang}"
                            mlp:echo "hello, can you understand me"
                            break
                        else
                            echo -e "${yellow}$(mlp:echo "the language you selected is not ready, please try again")${reset}"
                            export langcounter="$(( ${langcounter} + 1))"
                            if [[ "${langcounter}" -eq 3 ]] ; then
                                export langcounter="0"
                                break
                            fi
                        fi
                    done
                ;;
                [hH][eE][lL][pP])
                    echo -e "comming soon.."
                ;;
                [bB][aA][nN][nN][eE][rR])
                    bc:banner
                ;;
                [cC][lL][eE][aA][rR]|[cC][lL][sS])
                    if check:cmd "clear" ; then
                        clear
                    fi
                ;;
                [eE][xX][iI][tT]|[qQ][uU][iI][tT])
                    bc:cleanexit
                ;;
                *)
                    if [[ -f "${CWD}/tools/${param[0]}.meta" ]] ; then
                        echo -e "${yellow}$(mlp:echo "did you mean select") ${reset}\"${cyan}select ${param[0]}${reset}\""
                    else
                        mlp:echo "unknown command, type help to get information about existing commands"
                    fi
                ;;
            esac
        done
    ;;
    "help")
        bc:_init_ "silent"
        echo "comming soon.."
        bc:cleanexit
    ;;
    *)
        echo -e "\tthere is no option like \"${option}\"."
        exit 1
    ;;
esac