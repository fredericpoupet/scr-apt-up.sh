#!/bin/bash

# Variables : _ date_int
#             _ date_new
#             _ date_old
#             _ date_tz
#             _ date_utc
#             _ hostname
#             _ mode_exec
#             _ saisie
#             _ resume_1
#             _ resume_2
#             _ system_name
#             _ system_version_init
#             _ system_version_fin
#             _ time_end
#             _ time_execution_h
#             _ time_execution_m
#             _ time_execution_s
#             _ time_start
#             _ tz

echo ""

echo "----------------------------------------------------------------------------------" | tee scr-apt-up.log
echo "-                                                                                -" | tee -a scr-apt-up.log
echo "-            SCRIPT : scr-apt-up.sh                                              -" | tee -a scr-apt-up.log
echo "-              DATE : 01/11/2023                                                 -" | tee -a scr-apt-up.log
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

system_name=$(cat /etc/os-release | grep -w 'NAME=' | cut -d "\"" -f 2)
system_version_init=$(cat /etc/os-release | grep -w 'VERSION=' | cut -d "\"" -f 2)

echo "" | tee -a scr-apt-up.log

echo "                  DATE :          LOC : $date_tz -$tz" | tee -a scr-apt-up.log
echo "                                  UTC : $date_utc" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

date_old=$(zcat /var/log/apt/history.log.*.gz 2> /dev/null | cat - /var/log/apt/history.log | grep "Start-Date: " | tail -n 1 | cut -d " " -f 2)
date_new=$(date +"%Y-%m-%d")
date_int=$(( ( $(date -d "$date_new" +%s) - $(date -d "$date_old" +%s) ) / 86400 ))

echo "  DERNIERE MISE A JOUR :         DATE : $date_old" | tee -a scr-apt-up.log

echo "                         * INTERVALLE : $date_int JOUR(S)" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "           UTILISATEUR :          NOM : $USER" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "SYSTEME D'EXPLOITATION :          NOM : $system_name" | tee -a scr-apt-up.log
echo "                              VERSION : $system_version_init" | tee -a scr-apt-up.log
echo "                             HOSTNAME : $hostname" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "-------------" | tee -a scr-apt-up.log
echo "Avertissement" | tee -a scr-apt-up.log
echo "-------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log
echo "Dans un environnement de PRODUCTION, il est recommandé de procéder à la mise à jour minimale du système." | tee -a scr-apt-up.log
echo "" | tee -a scr-apt-up.log
echo "Seront alors utilisées les commandes suivantes : _ \"sudo apt-get update\" ;" | tee -a scr-apt-up.log
echo "                                                 _ \"sudo apt-get upgrade -Vy\"." | tee -a scr-apt-up.log
echo "" | tee -a scr-apt-up.log
echo "Dans un environnement de TEST, la mise à jour du système peut être maximale." | tee -a scr-apt-up.log
echo "" | tee -a scr-apt-up.log
echo "Seront alors utilisées les commandes suivantes : _ \"sudo apt-get update\" ;" | tee -a scr-apt-up.log
echo "                                                 _ \"sudo apt-get dist-upgrade -Vy\" ;" | tee -a scr-apt-up.log
echo "                                                 _ \"sudo apt-get autoremove -y\" ;" | tee -a scr-apt-up.log
echo "                                                 _ \"sudo apt-get clean\"." | tee -a scr-apt-up.log
echo "" | tee -a scr-apt-up.log

echo "----------------------------------------" | tee -a scr-apt-up.log
echo "Définition du mode d'exécution du script" | tee -a scr-apt-up.log
echo "----------------------------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log
echo "Saisissez \"test\" si le système est en environnement de TEST, sinon, par défaut, le script s'exécutera en mode PRODUCTION." | tee -a scr-apt-up.log
echo "" | tee -a scr-apt-up.log

read saisie

echo "" | tee -a scr-apt-up.log

if [ "$saisie" != "test" ];

	then
	
		mode_exec="PRODUCTION"
	
	else
	
		mode_exec="TEST"

fi

echo "Mode d'exécution : $mode_exec." | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "------------------------------------------------------" | tee -a scr-apt-up.log
echo "Saisie du mot de passe de l'utilisateur, si nécessaire" | tee -a scr-apt-up.log
echo "------------------------------------------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

sudo echo "prout" > /dev/null

echo "" | tee -a scr-apt-up.log

if [ "$mode_exec" != "TEST" ];

	then
	
		echo "-------------------" | tee -a scr-apt-up.log
		echo "sudo apt-get update" | tee -a scr-apt-up.log
		echo "-------------------" | tee -a scr-apt-up.log

		echo "" | tee -a scr-apt-up.log

		sudo apt-get update | tee -a scr-apt-up.log

		echo "" | tee -a scr-apt-up.log

		echo "------------------------" | tee -a scr-apt-up.log
		echo "sudo apt-get upgrade -Vy" | tee -a scr-apt-up.log
		echo "------------------------" | tee -a scr-apt-up.log

		echo "" | tee -a scr-apt-up.log

		sudo apt-get upgrade -Vy | tee -a scr-apt-up.log

		echo "" | tee -a scr-apt-up.log
	
	else
	
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

	fi

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

system_version_fin=$(cat /etc/os-release | grep 'VERSION=' | cut -d "\"" -f 2)

echo "" | tee -a scr-apt-up.log

echo "                  DATE :       LOC : $date_tz -$tz" | tee -a scr-apt-up.log
echo "                               UTC : $date_utc" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "     DUREE D'EXECUTION :  SECONDES : $time_execution_s" | tee -a scr-apt-up.log
echo "                         * MINUTES : $time_execution_m" | tee -a scr-apt-up.log
echo "                          * HEURES : $time_execution_h" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "      MODE D'EXECUTION :         - : $mode_exec" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "SYSTEME D'EXPLOITATION :   VERSION : $system_version_init > $system_version_fin" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

cat scr-apt-up.log | grep "nouvellement install.s" > /dev/null

if [ "$?" == 0 ];

	then

        resume_1=$(cat scr-apt-up.log | grep -m1 "nouvellement install.s")

        cat scr-apt-up.log | grep "n.cessaire de prendre" > /dev/null

        if [ "$?" == 0 ];

            then

                resume_2=$(cat scr-apt-up.log | grep "n.cessaire de prendre")

            else

                resume_2="-"

        fi

        cat scr-apt-up.log | grep "Apr.s cette op.ration" > /dev/null

        if [ "$?" == 0 ];

            then

                resume_3=$(cat scr-apt-up.log | grep "Apr.s cette op.ration")

            else

                resume_3="-"

        fi

	else

        resume_1=$(cat scr-apt-up.log | grep "newly installed")

        cat scr-apt-up.log | grep "Need to get" > /dev/null

        if [ "$?" == 0 ];

            then

                resume_2=$(cat scr-apt-up.log | grep "Need to get")

            else

                resume_2="-"

        fi

        cat scr-apt-up.log | grep "After this operation" > /dev/null

        if [ "$?" == 0 ];

            then

                resume_3=$(cat scr-apt-up.log | grep "After this operation")

            else

                resume_3="-"

        fi

fi

echo "                RESUME :   PAQUETS : $resume_1" | tee -a scr-apt-up.log
echo "                            TAILLE : $resume_2" | tee -a scr-apt-up.log
echo "                            DISQUE : $resume_3" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "----------------------------" | tee -a scr-apt-up.log
echo "Fin de l'exécution du script" | tee -a scr-apt-up.log
echo "----------------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log
