#!/bin/bash

# Variables : _ date_tz
#             _ date_utc
#             _ hostname
#             _ system_name
#             _ system_version
#             _ time_end
#             _ time_execution_h
#             _ time_execution_m
#             _ time_execution_s
#             _ time_start
#             _ tz

echo "" | tee scr-apt-up.log

echo "----------------------------------------------------------------------------------" | tee -a scr-apt-up.log
echo "-                                                                                -" | tee -a scr-apt-up.log
echo "-            SCRIPT : scr-apt-up.sh                                              -" | tee -a scr-apt-up.log
echo "-              DATE : 26/08/2023                                                 -" | tee -a scr-apt-up.log
echo "-            AUTEUR : Frédéric POUPET                                            -" | tee -a scr-apt-up.log
echo "-            SOURCE : https://github.com/fredericpoupet/scr-apt-up.sh            -" | tee -a scr-apt-up.log
echo "-                                                                                -" | tee -a scr-apt-up.log
echo "----------------------------------------------------------------------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "------------------------------------------------------------" | tee -a scr-apt-up.log
echo "Informations relatives au démarrage de l'exécution du script" | tee -a scr-apt-up.log
echo "------------------------------------------------------------" | tee -a scr-apt-up.log

tz=$(timedatectl | grep 'Time zone' | cut -d ":" -f 2)

date_tz=$(date)
date_utc=$(date -u)

time_start=$(date +%s)

hostname=$(hostname)

system_name=$(cat /etc/*release | grep 'PRETTY_NAME=' | cut -d "\"" -f 2)
system_version=$(cat /etc/*release | grep 'VERSION=' | cut -d "\"" -f 2)

echo "" | tee -a scr-apt-up.log

echo "                  DATE :      LOC : $date_tz -$tz" | tee -a scr-apt-up.log
echo "                              UTC : $date_utc" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "           UTILISATEUR :      NOM : $USER" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "SYSTEME D'EXPLOITATION :      NOM : $system_name" | tee -a scr-apt-up.log
echo "                          VERSION : $system_version" | tee -a scr-apt-up.log
echo "                         HOSTNAME : $hostname" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "-------------------" | tee -a scr-apt-up.log
echo "sudo apt-get update" | tee -a scr-apt-up.log
echo "-------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

sudo apt-get update | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "-----------------------------" | tee -a scr-apt-up.log
echo "sudo apt-get dist-upgrade -Vy" | tee -a scr-apt-up.log
echo "-----------------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

sudo apt-get dist-upgrade -Vy | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "--------------------------" | tee -a scr-apt-up.log
echo "sudo apt-get autoremove -y" | tee -a scr-apt-up.log
echo "--------------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

sudo apt-get autoremove -y | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "------------------" | tee -a scr-apt-up.log
echo "sudo apt-get clean" | tee -a scr-apt-up.log
echo "------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

sudo apt-get clean | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

time_end=$(date +%s)

time_execution_s=$((time_end - time_start))
time_execution_m=$((time_execution_s / 60))
time_execution_h=$((time_execution_m / 60))

echo "--------------------------------------------------------" | tee -a scr-apt-up.log
echo "Informations relatives à la fin de l'exécution du script" | tee -a scr-apt-up.log
echo "--------------------------------------------------------" | tee -a scr-apt-up.log

tz=$(timedatectl | grep 'Time zone' | cut -d ":" -f 2)

date_tz=$(date)
date_utc=$(date -u)

system_version=$(cat /etc/*release | grep 'VERSION=' | cut -d "\"" -f 2)

echo "" | tee -a scr-apt-up.log

echo "                  DATE :       LOC : $date_tz -$tz" | tee -a scr-apt-up.log
echo "                               UTC : $date_utc" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "     DUREE D'EXECUTION :  SECONDES : $time_execution_s" | tee -a scr-apt-up.log
echo "                         * MINUTES : $time_execution_m" | tee -a scr-apt-up.log
echo "                          * HEURES : $time_execution_h" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "SYSTEME D'EXPLOITATION :   VERSION : $system_version" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "----------------------------" | tee -a scr-apt-up.log
echo "Fin de l'exécution du script" | tee -a scr-apt-up.log
echo "----------------------------" | tee -a scr-apt-up.log
