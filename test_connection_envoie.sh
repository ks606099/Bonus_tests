#!/bin/bash -x

echo "Test de connection et envoi d’un message par un seul client"
localhost='127.0.0.1'
PORT=5001
#message='toto'
xterm -e python server.py $PORT& 
echo 'toto' | nc $localhost $PORT >> resultat.txt
if [[ $resultat -eq 'toto' ]]
	then 
	echo "Test Réussi"
else	
	echo "Echec Test"
fi
kill %1
# retrouver pid du serveur
#pid=$[ps aux | grep 'server.py' | awk '{print $2}'] 

# tuer le serveur
#echo $pid
#kill $pid
