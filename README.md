# scr-apt-up.sh

Script de mise à jour d'une distribution Linux exploitant APT en tant que gestionnaire de paquets.

## Détails

- L'effet recherché est l'obtention d'un outil facile à déployer et à mettre en œuvre afin de réaliser la montée de version des logiciels d'une façon standardisée ;
- Le résultat de la dernière exécution du script est enregistré dans le fichier **scr-apt-up.log** ;
- Le caractère "*" préfixant certains résultats précise qu'ils sont obtenus par calcul et non par lecture directe.

## Précisions

Le script exécute de manière selective, selon l'environnement déclaré, les commandes suivantes :

```
[PRODUCTION|TEST] sudo apt-get update
```

Mise à jour de la liste des fichiers dans les dépôts APT du fichier /etc/apt/sources.list.

```
[PRODUCTION] sudo apt-get upgrade -Vy
```

Mise à jour de tous les paquets installés vers les dernières versions sans installer de nouveaux paquets.

```
[TEST] sudo apt-get dist-upgrade -Vy
```

Mise à jour de tous les paquets installés vers les dernières versions en installant de nouveaux paquets si nécessaire.

```
[TEST] sudo apt-get autoremove -y
```
Suppression des paquets ainsi que leurs dépendances devenus inutiles. Les fichiers de configuration de ces paquets sont toutefois conservés.

```
[TEST] sudo apt-get clean
```
Suppression de tous les paquets du dossier /var/cache/apt/archives.

## Révisions attendues

...

## Révisions réalisées

01/11/2023
__________

- [X] Détermination des informations du système d'après le fichier **/etc/os-release** afin de maximiser la compatibilité ;
- [X] Comparaison, à la fin de l'exécution du script, des versions initiales et finales du système. Cette fonction est compatible avec les langues française et anglaise ;
- [X] Indication, à la fin de l'exécution du script, des modifications apportées au système par les commandes **sudo apt-get upgrade -Vy** et **sudo apt-get dist-upgrade -Vy**. Les indications relatives aux modifications apportées au système par la commande **sudo apt-get autoremove -y** sont ignorées.

29/09/2023
__________

- [X] Différentiation des commandes en fonction de l'environnement d'exécution **PRODUCTION** ou **TEST** déclaré ;
- [X] Indication de la date de la dernière mise à jour du système ainsi que de l'intervalle de temps depuis cette date.

25/08/2023
__________
    
- [X] Suppression de la commande **sudo apt-get autoclean**, redondante avec la commande **sudo apt-get clean** ;
- [X] Intégration de l'horodatage et de la duré de l'exécution du script.

## Exemple de résultat

```
----------------------------------------------------------------------------------
-                                                                                -
-            SCRIPT : scr-apt-up.sh                                              -
-              DATE : 01/11/2023                                                 -
-            AUTEUR : Frédéric POUPET                                            -
-            SOURCE : https://github.com/fredericpoupet/scr-apt-up.sh            -
-                                                                                -
----------------------------------------------------------------------------------

------------------------------------------------------------
Informations relatives au démarrage de l'exécution du script
------------------------------------------------------------

                  DATE :          LOC : mer. 01 nov. 2023 16:54:01 CET - Europe/Paris (CET, +0100)
                                  UTC : mer. 01 nov. 2023 15:54:01 UTC

  DERNIERE MISE A JOUR :         DATE : 2023-11-01
                         * INTERVALLE : 0 JOUR(S)

           UTILISATEUR :          NOM : user

SYSTEME D'EXPLOITATION :          NOM : Linux Mint
                              VERSION : 21.2 (Victoria)
                             HOSTNAME : user-virtual-machine

-------------
Avertissement
-------------

Dans un environnement de PRODUCTION, il est recommandé de procéder à la mise à jour minimale du système.

Seront alors utilisées les commandes suivantes : _ "sudo apt-get update" ;
                                                 _ "sudo apt-get upgrade -Vy".

Dans un environnement de TEST, la mise à jour du système peut être maximale.

Seront alors utilisées les commandes suivantes : _ "sudo apt-get update" ;
                                                 _ "sudo apt-get dist-upgrade -Vy" ;
                                                 _ "sudo apt-get autoremove -y" ;
                                                 _ "sudo apt-get clean".

----------------------------------------
Définition du mode d'exécution du script
----------------------------------------

Saisissez "test" si le système est en environnement de TEST, sinon, par défaut, le script s'exécutera en mode PRODUCTION.


Mode d'exécution : TEST.

------------------------------------------------------
Saisie du mot de passe de l'utilisateur, si nécessaire
------------------------------------------------------


-------------------
sudo apt-get update
-------------------

Atteint :1 http://archive.ubuntu.com/ubuntu jammy InRelease
Ign :2 http://packages.linuxmint.com victoria InRelease
Atteint :3 http://security.ubuntu.com/ubuntu jammy-security InRelease
Atteint :4 http://archive.ubuntu.com/ubuntu jammy-updates InRelease
Atteint :5 http://packages.linuxmint.com victoria Release
Atteint :7 http://archive.ubuntu.com/ubuntu jammy-backports InRelease
Lecture des listes de paquets…

-----------------------------
sudo apt-get dist-upgrade -Vy
-----------------------------

Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
Calcul de la mise à jour…
Les NOUVEAUX paquets suivants seront installés :
   libwpe-1.0-1 (1.14.0-0ubuntu0.22.04.1)
   libwpebackend-fdo-1.0-1 (1.14.2-0ubuntu0.22.04.1)
   linux-headers-5.15.0-88 (5.15.0-88.98)
   linux-headers-5.15.0-88-generic (5.15.0-88.98)
   linux-image-5.15.0-88-generic (5.15.0-88.98)
   linux-modules-5.15.0-88-generic (5.15.0-88.98)
   linux-modules-extra-5.15.0-88-generic (5.15.0-88.98)
Les paquets suivants seront mis à jour :
   gir1.2-javascriptcoregtk-4.0 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   gir1.2-javascriptcoregtk-4.1 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   gir1.2-webkit2-4.0 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   gir1.2-webkit2-4.1 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   libjavascriptcoregtk-4.0-18 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   libjavascriptcoregtk-4.1-0 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   libwebkit2gtk-4.0-37 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   libwebkit2gtk-4.1-0 (2.38.6-0ubuntu0.22.04.1 => 2.42.1-0ubuntu0.22.04.1)
   linux-generic (5.15.0.76.74 => 5.15.0.88.85)
   linux-headers-generic (5.15.0.76.74 => 5.15.0.88.85)
   linux-image-generic (5.15.0.76.74 => 5.15.0.88.85)
11 mis à jour, 7 nouvellement installés, 0 à enlever et 0 non mis à jour.
Il est nécessaire de prendre 173 Mo dans les archives.
Après cette opération, 611 Mo d'espace disque supplémentaires seront utilisés.
Réception de :1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-webkit2-4.0 amd64 2.42.1-0ubuntu0.22.04.1 [104 kB]
Réception de :2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-javascriptcoregtk-4.0 amd64 2.42.1-0ubuntu0.22.04.1 [38,1 kB]
Réception de :3 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libwebkit2gtk-4.0-37 amd64 2.42.1-0ubuntu0.22.04.1 [21,6 MB]
Réception de :4 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libjavascriptcoregtk-4.0-18 amd64 2.42.1-0ubuntu0.22.04.1 [8 123 kB]
Réception de :5 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libwpe-1.0-1 amd64 1.14.0-0ubuntu0.22.04.1 [21,1 kB]
Réception de :6 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libwpebackend-fdo-1.0-1 amd64 1.14.2-0ubuntu0.22.04.1 [34,4 kB]
Réception de :7 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 gir1.2-webkit2-4.1 amd64 2.42.1-0ubuntu0.22.04.1 [104 kB]
Réception de :8 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 gir1.2-javascriptcoregtk-4.1 amd64 2.42.1-0ubuntu0.22.04.1 [38,1 kB]
Réception de :9 http://archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libwebkit2gtk-4.1-0 amd64 2.42.1-0ubuntu0.22.04.1 [21,7 MB]
Réception de :10 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 libjavascriptcoregtk-4.1-0 amd64 2.42.1-0ubuntu0.22.04.1 [8 124 kB]
Réception de :11 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-modules-5.15.0-88-generic amd64 5.15.0-88.98 [22,4 MB]
Réception de :12 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-5.15.0-88-generic amd64 5.15.0-88.98 [11,5 MB]
Réception de :13 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-modules-extra-5.15.0-88-generic amd64 5.15.0-88.98 [64,0 MB]
Réception de :14 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-generic amd64 5.15.0.88.85 [1 698 B]
Réception de :15 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-generic amd64 5.15.0.88.85 [2 488 B]
Réception de :16 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-88 all 5.15.0-88.98 [12,3 MB]
Réception de :17 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-88-generic amd64 5.15.0-88.98 [2 878 kB]
Réception de :18 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-generic amd64 5.15.0.88.85 [2 340 B]
173 Mo réceptionnés en 1min 18s (2 213 ko/s)
(Lecture de la base de données... 
(Lecture de la base de données... 5%
(Lecture de la base de données... 10%
(Lecture de la base de données... 15%
(Lecture de la base de données... 20%
(Lecture de la base de données... 25%
(Lecture de la base de données... 30%
(Lecture de la base de données... 35%
(Lecture de la base de données... 40%
(Lecture de la base de données... 45%
(Lecture de la base de données... 50%
(Lecture de la base de données... 55%
(Lecture de la base de données... 60%
(Lecture de la base de données... 65%
(Lecture de la base de données... 70%
(Lecture de la base de données... 75%
(Lecture de la base de données... 80%
(Lecture de la base de données... 85%
(Lecture de la base de données... 90%
(Lecture de la base de données... 95%
(Lecture de la base de données... 100%
(Lecture de la base de données... 526768 fichiers et répertoires déjà installés.)
Préparation du dépaquetage de .../00-gir1.2-webkit2-4.0_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de gir1.2-webkit2-4.0:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Préparation du dépaquetage de .../01-gir1.2-javascriptcoregtk-4.0_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de gir1.2-javascriptcoregtk-4.0:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Préparation du dépaquetage de .../02-libwebkit2gtk-4.0-37_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de libwebkit2gtk-4.0-37:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Préparation du dépaquetage de .../03-libjavascriptcoregtk-4.0-18_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de libjavascriptcoregtk-4.0-18:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Sélection du paquet libwpe-1.0-1:amd64 précédemment désélectionné.
Préparation du dépaquetage de .../04-libwpe-1.0-1_1.14.0-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de libwpe-1.0-1:amd64 (1.14.0-0ubuntu0.22.04.1) ...
Sélection du paquet libwpebackend-fdo-1.0-1:amd64 précédemment désélectionné.
Préparation du dépaquetage de .../05-libwpebackend-fdo-1.0-1_1.14.2-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de libwpebackend-fdo-1.0-1:amd64 (1.14.2-0ubuntu0.22.04.1) ...
Préparation du dépaquetage de .../06-gir1.2-webkit2-4.1_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de gir1.2-webkit2-4.1:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Préparation du dépaquetage de .../07-gir1.2-javascriptcoregtk-4.1_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de gir1.2-javascriptcoregtk-4.1:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Préparation du dépaquetage de .../08-libwebkit2gtk-4.1-0_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de libwebkit2gtk-4.1-0:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Préparation du dépaquetage de .../09-libjavascriptcoregtk-4.1-0_2.42.1-0ubuntu0.22.04.1_amd64.deb ...
Dépaquetage de libjavascriptcoregtk-4.1-0:amd64 (2.42.1-0ubuntu0.22.04.1) sur (2.38.6-0ubuntu0.22.04.1) ...
Sélection du paquet linux-modules-5.15.0-88-generic précédemment désélectionné.
Préparation du dépaquetage de .../10-linux-modules-5.15.0-88-generic_5.15.0-88.98_amd64.deb ...
Dépaquetage de linux-modules-5.15.0-88-generic (5.15.0-88.98) ...
Sélection du paquet linux-image-5.15.0-88-generic précédemment désélectionné.
Préparation du dépaquetage de .../11-linux-image-5.15.0-88-generic_5.15.0-88.98_amd64.deb ...
Dépaquetage de linux-image-5.15.0-88-generic (5.15.0-88.98) ...
Sélection du paquet linux-modules-extra-5.15.0-88-generic précédemment désélectionné.
Préparation du dépaquetage de .../12-linux-modules-extra-5.15.0-88-generic_5.15.0-88.98_amd64.deb ...
Dépaquetage de linux-modules-extra-5.15.0-88-generic (5.15.0-88.98) ...
Préparation du dépaquetage de .../13-linux-generic_5.15.0.88.85_amd64.deb ...
Dépaquetage de linux-generic (5.15.0.88.85) sur (5.15.0.76.74) ...
Préparation du dépaquetage de .../14-linux-image-generic_5.15.0.88.85_amd64.deb ...
Dépaquetage de linux-image-generic (5.15.0.88.85) sur (5.15.0.76.74) ...
Sélection du paquet linux-headers-5.15.0-88 précédemment désélectionné.
Préparation du dépaquetage de .../15-linux-headers-5.15.0-88_5.15.0-88.98_all.deb ...
Dépaquetage de linux-headers-5.15.0-88 (5.15.0-88.98) ...
Sélection du paquet linux-headers-5.15.0-88-generic précédemment désélectionné.
Préparation du dépaquetage de .../16-linux-headers-5.15.0-88-generic_5.15.0-88.98_amd64.deb ...
Dépaquetage de linux-headers-5.15.0-88-generic (5.15.0-88.98) ...
Préparation du dépaquetage de .../17-linux-headers-generic_5.15.0.88.85_amd64.deb ...
Dépaquetage de linux-headers-generic (5.15.0.88.85) sur (5.15.0.76.74) ...
Paramétrage de libwpe-1.0-1:amd64 (1.14.0-0ubuntu0.22.04.1) ...
Paramétrage de libjavascriptcoregtk-4.0-18:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de gir1.2-javascriptcoregtk-4.0:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de linux-headers-5.15.0-88 (5.15.0-88.98) ...
Paramétrage de libwpebackend-fdo-1.0-1:amd64 (1.14.2-0ubuntu0.22.04.1) ...
Paramétrage de libjavascriptcoregtk-4.1-0:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de libwebkit2gtk-4.0-37:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de libwebkit2gtk-4.1-0:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de gir1.2-webkit2-4.0:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de linux-headers-5.15.0-88-generic (5.15.0-88.98) ...
/etc/kernel/header_postinst.d/dkms:
 * dkms: running auto installation service for kernel 5.15.0-88-generic
   ...done.
Paramétrage de gir1.2-javascriptcoregtk-4.1:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de gir1.2-webkit2-4.1:amd64 (2.42.1-0ubuntu0.22.04.1) ...
Paramétrage de linux-headers-generic (5.15.0.88.85) ...
Paramétrage de linux-image-5.15.0-88-generic (5.15.0-88.98) ...
I: /boot/vmlinuz.old is now a symlink to vmlinuz-5.15.0-76-generic
I: /boot/vmlinuz is now a symlink to vmlinuz-5.15.0-88-generic
I: /boot/initrd.img is now a symlink to initrd.img-5.15.0-88-generic
Paramétrage de linux-modules-extra-5.15.0-88-generic (5.15.0-88.98) ...
Paramétrage de linux-modules-5.15.0-88-generic (5.15.0-88.98) ...
Paramétrage de linux-image-generic (5.15.0.88.85) ...
Paramétrage de linux-generic (5.15.0.88.85) ...
Traitement des actions différées (« triggers ») pour libc-bin (2.35-0ubuntu3.4) ...
Traitement des actions différées (« triggers ») pour linux-image-5.15.0-88-generic (5.15.0-88.98) ...
/etc/kernel/postinst.d/dkms:
 * dkms: running auto installation service for kernel 5.15.0-88-generic
   ...done.
/etc/kernel/postinst.d/initramfs-tools:
update-initramfs: Generating /boot/initrd.img-5.15.0-88-generic
/etc/kernel/postinst.d/zz-update-grub:
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/50_linuxmint.cfg'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-5.15.0-88-generic
Found initrd image: /boot/initrd.img-5.15.0-88-generic
Found linux image: /boot/vmlinuz-5.15.0-76-generic
Found initrd image: /boot/initrd.img-5.15.0-76-generic
Warning: os-prober will be executed to detect other bootable partitions.
Its output will be used to detect bootable binaries on them and create new boot entries.
done

--------------------------
sudo apt-get autoremove -y
--------------------------

Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
0 mis à jour, 0 nouvellement installés, 0 à enlever et 0 non mis à jour.

------------------
sudo apt-get clean
------------------


--------------------------------------------------------
Informations relatives à la fin de l'exécution du script
--------------------------------------------------------

                  DATE :       LOC : mer. 01 nov. 2023 16:55:50 CET - Europe/Paris (CET, +0100)
                               UTC : mer. 01 nov. 2023 15:55:50 UTC

     DUREE D'EXECUTION :  SECONDES : 109
                         * MINUTES : 1
                          * HEURES : 0

      MODE D'EXECUTION :         - : TEST

SYSTEME D'EXPLOITATION :   VERSION : 21.2 (Victoria) > 21.2 (Victoria)

                RESUME :   PAQUETS : 11 mis à jour, 7 nouvellement installés, 0 à enlever et 0 non mis à jour.
                            TAILLE : Il est nécessaire de prendre 173 Mo dans les archives.
                            DISQUE : Après cette opération, 611 Mo d'espace disque supplémentaires seront utilisés.

----------------------------
Fin de l'exécution du script
----------------------------

```
