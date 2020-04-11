#!/bin/bash

#felipesi - 2017

if [ $# != 2 ]; then
	echo "USAGE: $0 imagem.jpg wordlist.txt"
else

for senha in $(cat $2); do
	steghide extract -sf $1 -p $senha -xf output.txt &> /dev/null
	if [ $? == 0 ]; then
		echo
		echo "SUCESS - $senha"
		echo "FILE: output.txt"
		break
	else
		echo "FAILED - $senha"
	fi
done
fi
