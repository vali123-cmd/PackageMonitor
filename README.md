# PackageMonitor
A linux script that monitors all the packages installed on your operating system.


HOW TO USE:
./packagemonitor.sh must be put in "crontab -e" at a period that you wish

./interogare.sh {param} *{data1} *{data2}

param = 1 => It will print all the programs that are currently installed on the system and the last date of the installation\n
param = 2 => It will print all the programs that have been installed on the system, but removed and the last date of their removal\n
param = 3 => It will print all the programs that have been in a status of half-installed on the system, and when they were half-installed\n
param = 4 => It will print all the operations that have taken place on a package that was installed at a time in your system\n
param = 5, data1 = "first date", data2 = "second date" => It will print all the operations that have taken place between 2 dates.\n

BACK-END (sau bash script)
Task #1 Realizarea scriptului de cron care da run la logarea dpkg.log o data la 30 de minute
Task #2 Realizarea directoarelor cu numele fiecarui software, daca deja exista nu se mai face alt director
Task #3 Realizarea unor directoare pe date calendaristice
Task #4 Realizarea subdirectoarelor pentru fiecare data , subdirectoarele vor avea numele pachetelor software pe care se fac operatiuni in acea zi
Task #5 Realizarea fisierelor din subdirectoare care contin operatiile de install si remove
Task #6 Realizarea scriptului de interogare pentru toate optiunile celor 5 optiuni ale parametrului "param"

