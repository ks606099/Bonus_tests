#!/bin/sh -x

# des truc a rajouter pour sa marche pour plusieurs client 

echo "Test de connection et envoi de message simultané par 3 clients"
localhost='127.0.0.1'
PORT1=5001
PORT2=5002
PORT3=5003
#message1='toto'
#message2='titi'
#message3='tata'
xterm -e python server.py $PORT1& client1
xterm -e python server.py $PORT2& client2
xterm -e python server.py $PORT3& client3

# client 1
resultat1=$[echo 'toto' | nc $localhost $PORT1 client1 ]
if [[ $resultat1 -eq 'toto' ]]
	then 
	echo 'client 1 :Test Réussi'
else
	echo 'client 1 :Echec Test'

fi
kill %1
#client 2

resultat2=$[echo 'titi' | nc $localhost $PORT2 client2 ]
if [[ $resultat2 -eq 'titi' ]]
	then 
	echo 'client 2: Test Réussi'
else
	echo 'client 2: Echec Test'

fi
kill %2
#client 3
resultat3=$[echo 'tata' | nc $localhost $PORT3 client3 ]
if [[ $resultat3 -eq 'tata' ]]
	then 
	echo 'client 3: Test Réussi'
else
	echo 'client 3: Echec Test'
fi
kill %3

