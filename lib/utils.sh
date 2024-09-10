quit() {
    echo -e "\n${blue}$(bc.gettext "Thanks for choosing us")${tp} - {${green}ByChan${tp}}${tp} :)"
    case "${1,,}" in
        "none")
            :
        ;;
        "break")
            break
        ;;
        *)
            exit 0
        ;;
    esac
}

pressanykey() {
    read -t "${1:-"3"}" -n 1 -r -s -p $'Press any key to continue...\n'
}

spinlong() {
    bar="---------------------------"
    barlength="${#bar}"
    i="0"
    while ((i < 100)); do
        n="$((i * barlength / 100))"
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM % 5 + 2))
        sleep "0.02"
    done
    echo -e "[${green}OK${tp}]"
}

bc.isnumber() {
    case "${1}" in
        ""|*[!0-9]*)
            return 1
        ;;
        *)
            return 0
        ;;
    esac
}

bc.credits() {
    requirus.sh --command "mlp-gettext.sh"
    echo -e "${blink}${lightgreen}---------------------------------------------${tp}
 ${cyan}$(bc.gettext "Create by")\t ${tp}${white}: ${red}ByCh4n${tp}
 ${cyan}Github${tp}\t\t ${white}: ${red}https://github.com/ByCh4n${tp}
 ${cyan}Discord${tp}\t ${white}: ${red}https://discord.gg/6zEu3hC9uR${tp}
 ${cyan}Instagram${tp}\t ${white}: ${red}@huseyinaltns${tp}
${blink}${lightgreen}---------------------------------------------${tp}"
}