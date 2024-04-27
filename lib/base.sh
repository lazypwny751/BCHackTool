version=(
	"3"
	"2"
	"0"
)

quit() {
    echo -e "\n[${blink}${yellow}*${tp}]${blue} $(mlp-gettext.sh --path "${MLD}" --language "${BCLANG}" "Thanks for choosing us")${tp} - {${green}ByChan${tp}}${tp} :)"
    exit 0
}

pressanykey() {
    read -t "${1:-"3"}" -n 1 -r -s -p $'Press any key to continue...\n'
}

spinlong() {
    bar="---------------------------"
    barlength="${#bar}"
    i="0"
    while ((i < 100)); do
        n="$((i*barlength / 100))"
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM % 5 + 2))
        sleep "0.02"
    done
    echo -e "[${green}OK${tp}]"
}

bc.credits() {
    requirus.sh --command "mlp-gettext.sh"
    echo -e "${blink}${lightgreen}---------------------------------------------${tp}
 ${cyan}$(mlp-gettext.sh --path "${MLD}" --language "${BCLANG}" "Create by")\t ${tp}${white}: ${red}ByCh4n${tp}
 ${cyan}Github${tp}\t\t ${white}: ${red}https://github.com/ByCh4n${tp}
 ${cyan}Instagram${tp}\t ${white}: ${red}@huseyinaltns${tp}
${blink}${lightgreen}---------------------------------------------${tp}"
}

bc.shell() {
    while :; do
        bc.banner
        bc.credits
        echo -e "~~~~~~~~~~~~~~~~~~~~~ ${green}BCHackTool${tp} ~~~~~~~~~~~~~~~~~~~~~~~~~" 

        # Get Tool List as Array
        readarray -t TOOLLIST < <(libt.parsetool $(libt.getfiles "${BCTOOLD}"))

        # List tools
        export _c="0" # counter
        for tool in "${TOOLLIST[@]}" ; do
            (( _c += 1 ))
            if (( "${_c}" % 2 != 0 )) ; then
               printf "${lightcyan}[${tp}${_c}${lightcyan}]${tp} ${yellow}${tool}${tp}\t\t"
            else
               printf "${lightcyan}[${tp}${_c}${lightcyan}]${tp} ${yellow}${tool}${tp}\n"
            fi       
        done

        printf "\n\nprompt:> " 
        read null
    done
}