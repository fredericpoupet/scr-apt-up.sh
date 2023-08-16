#!/bin/bash

echo "" | tee scr-apt-up.log

echo "-----------------------------------------------" | tee -a scr-apt-up.log
echo "-                                             -" | tee -a scr-apt-up.log
echo "-            SCRIPT : scr-apt-up.sh           -" | tee -a scr-apt-up.log
echo "-              DATE : 16/08/2023              -" | tee -a scr-apt-up.log
echo "-            AUTEUR : Frédéric POUPET         -" | tee -a scr-apt-up.log
echo "-         REFERENCE : XXX                     -" | tee -a scr-apt-up.log
echo "-                                             -" | tee -a scr-apt-up.log
echo "-----------------------------------------------" | tee -a scr-apt-up.log

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

echo "----------------------" | tee -a scr-apt-up.log
echo "sudo apt-get autoclean" | tee -a scr-apt-up.log
echo "----------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

sudo apt-get autoclean | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "------------------" | tee -a scr-apt-up.log
echo "sudo apt-get clean" | tee -a scr-apt-up.log
echo "------------------" | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

sudo apt-get clean | tee -a scr-apt-up.log

echo "" | tee -a scr-apt-up.log

echo "----------------------------" | tee -a scr-apt-up.log
echo "Fin de l'exécution du script" | tee -a scr-apt-up.log
echo "----------------------------" | tee -a scr-apt-up.log
