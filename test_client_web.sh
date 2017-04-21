#!/bin/sh -x

 #localhost
localhost='127.0.0.1'
IRC_PORT=50001
WEB_PORT=8080

# lancement du serveur
xterm -e python server.py $WEB_PORT $IRC_PORT&
xterm -e python client.py localhost $WEB_PORT Phil&
# On recupere le fichier web index.html sur un fichier test qu'on aura créé
###### Code Abdu wget localhost creer un fichier 
#### puis 
echo 'Discipline is the bridge between goals and accomplishment'


nc localhost $WEB_PORT << EOF > resultat.txt
wget $localhost:$WEB_PORT >> index.html.1 
GET / HTTP/1.1
connection.close()\n 
\n
EOF
diff resultat.txt index.html
if [[$? -eq 0]]
	then
	echo 'Success'
else
	echo 'Failed'
fi
#kill %1

# retrouver pid du serveur
#pid_server=$[ps aux | grep 'server.py' | awk '{print $2}'] 
# retrouver pid du client
#pid_client=$[ps aux | grep 'client.py' | awk '{print $2}'] 
# tuer le serveur
#echo $pid
#kill $pid_server
#kill $pid_client


