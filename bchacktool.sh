#!/bin/bash

set -e
export CWD="${PWD}" PATH="${PATH}:${PWD}/bin"
export BCLIB=(
    "base.sh"
    "color.sh"
)

[[ ! -x "${PWD}/bin/requirus.sh" ]] && {
    echo "Requirement helper isn't executable, you can try: ~$ chmod u+x bin/requirus.sh"
    exit 1
}

source requirus.sh --library "${CWD}/lib" "${BCLIB[@]}"
requirus.sh --command "mlp-gettext.sh"
trap quit INT

# -*-*- Main -*-*-
while :; do
    bc.banner
    echo "~~~~~~~~~~~~~~~~~~~~~ BCHackTool ~~~~~~~~~~~~~~~~~~~~~~~~~" 
    echo ""
    echo " [1] ✔ Inshackle              [2] ✔ Kickthemout" 
    echo " [3] ✔ Zphisher               [4] ✔ UserRecon" 
    echo " [5] ✔ Instashell             [6] ✔ Cupp" 
    echo " [7] ✔ SpamWa                 [8] ✔ Ip-Tracer" 
    echo " [9] ✔ OSIF                   [10] ✔ CamHackers" 
    echo " [11] ✔ TheFatRat             [12] ✔ RequiredChan" 
	echo " [13] ✔ RED_HAWK              [14] ✔ Ghost" 
    echo -e " [x] ✔ Exit\n" 
    echo -ne "❨${red}BCHackTool@ByCh4n${tp}❩:(${blue}./BCHackTool${tp})\n↳[${blink}${lightcyan}*${tp}]➢ " ; read option
        
    case "${option}" in 
        1)
        if [[ -d inshackle-bot ]] ; then
            ok
        else
            clear
            cat banners/bcbanner  
            echo -e $red "[0] Inshackle İndiriliyor "
            git clone https://github.com/cyberkallan/inshackle-bot > /dev/null 2>&1
            spinlong
            echo -e $red "[1] Inshackle Kuruldu "
            cd inshackle-bot
            chmod +x inshackle.sh
            cd ..
            sleep 3
        fi
        clear
        cd inshackle-bot
        bash inshackle.sh
        cd ..
            ;;
        2) 
        if [[ -d kickthemout ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner
            echo -e $red "[0] Kickthemout İndiriliyor "
            git clone https://github.com/k4m4/kickthemout > /dev/null 2>&1
            spinlong
            cd kickthemout
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            apt install nmap -y
            apt install python3 -y             
            apt install python3-pip -y             
            pip3 install -r requirements.txt              
            chmod +x kickthemout.py
            } &> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] Kickthemout Kuruldu "
            sleep 3
        fi
        clear
        cd kickthemout
        python3 kickthemout.py
        cd ..
            ;;
        3)
         if [[ -d zphisher ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner  
            echo -e $red "[0] Zphisher İndiriliyor "
            git clone https://github.com/htr-tech/zphisher >  /dev/null 2>&1
            spinlong
            echo -e $red "[2] Zphisher Kuruldu "
            sleep 3
        fi
        clear
        cd zphisher
        bash zphisher.sh
        cd ..
            ;;
        4)
        if [[ -d userrecon ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner  
            echo -e $red "[0] UserRecon İndiriliyor "
            git clone https://github.com/issamelferkh/userrecon > /dev/null 2>&1
            spinlong
            cd userrecon
            chmod +x userrecon.sh
            echo -e $red "[1] UserRecon Kuruldu "
            cd ..
            sleep 3
        fi
        clear
        cd userrecon
        ./userrecon.sh
        cd ..
            ;;
        5)
        if [[ -d instashell ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner   
            echo -e $red "[0] Instashell İndiriliyor "
            git clone https://github.com/maxrooted/instashell > /dev/null 2>&1
            spinlong
            cd instashell
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            chmod +x instashell.sh
            chmod +x install.sh
            clear
            sudo ./install.sh
            clear
            service tor start
            } &> /dev/null
            spinlong
            echo -e $red "[2] Instashell Kuruldu "
            cd ..
            sleep 3
        fi
        clear
        cd instashell
        ./instashell.sh
        cd ..
            ;;
	    6)
        if [[ -d cupp ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner  
            echo -e $red "[0] Cupp İndiriliyor "
            git clone https://github.com/Mebus/cupp > /dev/null 2>&1
            spinlong
            cd cupp
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            chmod +x cup.py
            apt-get install -y python3
            } &> /dev/null
            spinlong
            echo -e $red "[2] Cupp Kuruldu "
            cd ..
            sleep 3
        fi
        clear
        cd cupp
        sudo python3 cupp.py -i
        cd ..
            ;;
	    7)
        if [[ -d SpamWa ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner 
            echo -e $red "[0] SpamWa İndiriliyor "
            git clone https://github.com/krypton-byte/SpamWa > /dev/null 2>&1
            spinlong
            cd SpamWa
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            chmod +x spam.py
            pip3 install requests
            } &> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] SpamWa Kuruldu "
            sleep 3
        fi
        clear
        cd SpamWa
        sudo python3 spam.py
        cd ..
            ;;
	    8)
        if [[ -d IP-Tracer ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner  
            echo -e $red "[0] IP-Tracer İndiriliyor "
            git clone https://github.com/rajkumardusad/IP-Tracer > /dev/null 2>&1
            spinlong
            cd IP-Tracer
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            chmod +x install
            ./install
            } &> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] IP-Tracer Kuruldu "
            sleep 3
        fi
        clear
        cd Ip-Tracer
        ip-tracer start
        cd ..
            ;;
	    9)
        if [[ -d OSIF ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner   
            echo -e $red "[0] OSIF İndiriliyor "
            git clone https://github.com/CiKu370/OSIF > /dev/null 2>&1
            spinlong
            cd OSIF
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            pip2 install -r requirements.txt
            } &> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] OSIF Kuruldu "
            sleep 3
        fi
        clear
        cd OSIF
        python2 osif.py
        cd ..
            ;;
	    10)
        if [[ -d Cam-Hackers ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner   
            echo -e $red "[0] Cam-Hackers İndiriliyor "
            git clone https://github.com/AngelSecurityTeam/Cam-Hackers > /dev/null 2>&1
            spinlong
            cd Cam-Hackers
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            apt-get install -y python3-pip
            pip3 install requests
            } &> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] Cam-Hackers Kuruldu "
            sleep 3
        fi
        clear
        cd Cam-Hackers
        sudo python3 cam-hackers.py
        pressanykey
            ;;
	    11)
        if [[ -d TheFatRat ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner   
            echo -e $red "[0] TheFatRat İndiriliyor "
            git clone https://github.com/screetsec/TheFatRat > /dev/null 2>&1
            spinlong
            cd TheFatRat
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            apt-get install -y default-jdk
            chmod +x setup.sh
			./setup.sh
            } #&> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] TheFatRat Kuruldu "
            sleep 3
        fi
        clear
        pwd
        cd TheFatRat
        pwd
        ./fatrat
        sleep 15
        cd ..
            ;;
        12)
        if [[ -d RequiredChan ]] ; then
            ok
        else 
            clear
            cat banners/bcbanner   
            echo -e $red "[0] RequiredChan İndiriliyor "
            git clone https://github.com/ByCh4n/RequiredChan > /dev/null 2>&1
            spinlong
            cd RequiredChan
            echo -e $red "[1] RequiredChan Kuruldu "
            sleep 3
        fi
        clear
        cd RequiredChan
        chmod +x reqchan
        ./reqchan
        cd ..
            ;;
        13)
        if [[ -d RED_HAWK ]] ; then
            ok
        else
            clear
            cat banners/bcbanner
            echo -e $red "[0] RED_HAWK İndiriliyor "
            git clone https://github.com/Tuhinshubhra/RED_HAWK > /dev/null 2>&1
            spinlong
            cd RED_HAWK
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            sudo apt-get -qq --assume-yes install php-curl
            sudo apt-get -qq --assume-yes install php-xml
            } &> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] RED_HAWK Kuruldu "
            sleep 3
        fi
        clear
        cd RED_HAWK
        php rhawk.php
            ;;
        14)
        if [[ -d ghost ]] ; then
            ok
        else
            clear
            cat banners/bcbanner
            echo -e $red "[0] Ghost İndiriliyor "
            git clone https://github.com/EntySec/Ghost > /dev/null 2>&1
            spinlong
            cd Ghost
            echo -e $red "[1] Ek Bileşenler Kuruluyor "
            {
            pip3 install git+https://github.com/EntySec/Ghost
            } &> /dev/null
            spinlong
            cd ..
            echo -e $red "[2] Ghost Kuruldu "
            sleep 3
        fi
        clear
        cd Ghost
        ghost
         	;;
    esac
done