#!/usr/bin/bash

#Creez o lista de packageuri instalate sortat dupa data
WORKDIR="$HOME/WorkDirectory"
LOGFILE="/var/log/dpkg.log.2.gz"

zcat /var/log/dpkg.log.2.gz | grep -w "install" | awk '{print $1, $2, $4}' >> $HOME/installedmonitor.txt
zcat /var/log/dpkg.log.2.gz | grep -w "remove" | awk '{print $1, $2, $4}' >> $HOME/removedmonitor.txt
zcat /var/log/dpkg.log.2.gz | grep -w "update" | awk '{print $1, $2, $4}' >> $HOME/updatedmonitor.txt   
sort -n $HOME/installedmonitor.txt > $HOME/facultate/data1.txt
sort -n $HOME/removedmonitor.txt > $HOME/facultate/data2.txt
sort -n $HOME/updatedmonitor.txt > $HOME/facultate/data3.txt
rm $HOME/removedmonitor.txt
rm $HOME/installedmonitor.txt
rm $HOME/updatedmonitor.txt

#Creez Workdirectory-ul mentionat in tema folosind awk.
#parametrul 1 e data, 2 e ora, 3 e numele programului
#folderul este generat asa deoarece avem nevoie de toate package-urile care au existat vreodata in sistem.
#De asemenea pentru date, trebuie adaugate in plus folderul cu datele la care s-a dat REMOVE si UPDATE!
mkdir -p $HOME/WorkDirectory
awk '{system("mkdir -p $HOME/WorkDirectory/" $3)}' $HOME/facultate/data1.txt    #aici numele de software care au fost instalate
awk '{system("mkdir -p $HOME/WorkDirectory/" $1)}' $HOME/facultate/data1.txt   #aici datele la care s-a facut install
awk '{system("mkdir -p $HOME/WorkDirectory/" $1)}' $HOME/facultate/data2.txt   #aici datele la care s-a facut remove
awk '{system("mkdir -p $HOME/WorkDirectory/" $1)}' $HOME/facultate/data3.txt   #aici datele la care s-a facut update
#data2 contine datele la care s-a dat remove, trebuie facute subdirectoare si pentru acele date!


#Acum, pentru fiecare subdirector generat(care reprezinta un package), voi adauga datele la care s-a facut install si remove.
awk '{system("touch $HOME/WorkDirectory/" $3 "/" $3)}' $HOME/facultate/data1.txt
awk '{system("touch $HOME/WorkDirectory/" $1 "/" $3 ".installed")}' $HOME/facultate/data1.txt 

awk '{system("touch $HOME/WorkDirectory/" $1 "/" $3 ".removed")}' $HOME/facultate/data2.txt

awk '{system("touch $HOME/WorkDirectory/" $1 "/" $3 ".updated")}' $HOME/facultate/data3.txt


for d in "$WORKDIR"/*; do   
    if [ -d "$d" ]; then
        name=$(basename "$d")
    
        if [[ ! $name =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
            if zcat "$LOGFILE" | grep -q "$name"; then
                zcat "$LOGFILE" | grep "$name" >> "$d/$name"
                
            fi
        fi

    fi
done

