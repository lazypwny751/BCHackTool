#!/bin/bash

# Do not edit this file cause generated automatically with mlp-codegen

case "${1}" in
	"Create by")
		echo "Yapımcı"
	;;

	"Thanks for choosing us")
		echo "Bizi seçtiğiniz için teşekkür ederiz"
	;;

	*)
		echo "${1}" # return id
	;;
esac
