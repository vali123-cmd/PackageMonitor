#!/usr/bin/bash

#Creez o lista de packageuri instalate sortat dupa data


zcat /var/log/dpkg.log.2.gz | grep -w "install" | awk '{print $1, $2, $4}' >> $HOME/installedmonitor.txt

sort -n $HOME/installedmonitor.txt > $HOME/facultate/data.txt
rm $HOME/installedmonitor.txt
#Creez Workdirectory-ul mentionat in tema folosind awk.
#parametrul 1 e data, 2 e ora, 3 e numele programului
#folderul este generat asa deoarece avem nevoie de toate package-urile care au existat vreodata in sistem.
#De asemenea pentru date, trebuie adaugate in plus folderul cu datele la care s-a dat REMOVE si UPDATE!
mkdir -p $HOME/WorkDirectory
awk '{system("mkdir -p $HOME/WorkDirectory/" $3)}' $HOME/facultate/data.txt
awk '{system("mkdir -p $HOME/WorkDirectory/" $1)}' $HOME/facultate/data.txt
exit 0
