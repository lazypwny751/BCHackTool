version=(
	"3"
	"2"
	"0"
)

quit() {
    echo -e "\n[${blink}${yellow}*${tp}]$blue BCHackTool Programini Tercih Ettiginiz Için Teşekkürler  {ByChan} :)$tp"
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

bc.banner() {
    requirus.sh --command "mlp-gettext.sh"
    echo -e "${blink}${lightgreen}---------------------------------------------${tp}
 ${cyan}$(mlp-gettext.sh "${LANG}" "Created by")${tp} - ${white}: ${red}ByCh4n${tp}
 ${cyan}Github${tp}\t\t ${white}: ${red}https://github.com/ByCh4n${tp}
 ${cyan}Instagram${tp}\t ${white}: ${red}@huseyinaltns${tp}
${blink}${lightgreen}---------------------------------------------${tp}"
}
