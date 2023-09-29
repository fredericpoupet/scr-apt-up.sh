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

- [X] Différentiation des commandes en fonction de l'environnement d'exécution **PRODUCTION** ou **TEST** déclaré ;
- [X] Indication de la date de la dernière mise à jour du système ainsi que de l'intervalle de temps depuis cette date ;
- [X] Suppression de la commande **sudo apt-get autoclean**, redondante avec la commande **sudo apt-get clean** ;
- [X] Intégration de l'horodatage et de la duré de l'exécution du script.

## Exemple de résultat

```
----------------------------------------------------------------------------------
-                                                                                -
-            SCRIPT : scr-apt-up.sh                                              -
-              DATE : 29/09/2023                                                 -
-            AUTEUR : Frédéric POUPET                                            -
-            SOURCE : https://github.com/fredericpoupet/scr-apt-up.sh            -
-                                                                                -
----------------------------------------------------------------------------------

------------------------------------------------------------
Informations relatives au démarrage de l'exécution du script
------------------------------------------------------------

                  DATE :          LOC : ven. 29 sept. 2023 09:55:54 CEST - Europe/Paris (CEST, +0200)
                                  UTC : ven. 29 sept. 2023 07:55:54 UTC

  DERNIERE MISE A JOUR :         DATE : 2023-09-28
                         * INTERVALLE : 1 JOUR(S)

           UTILISATEUR :          NOM : user

SYSTEME D'EXPLOITATION :          NOM : Kali GNU/Linux Rolling
                              VERSION : 2023.3
                             HOSTNAME : lin-kali-2023-2-000

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

Réception de :1 http://archive-4.kali.org/kali kali-rolling InRelease [41,2 kB]
Réception de :2 http://archive-4.kali.org/kali kali-rolling/main amd64 Packages [19,4 MB]
Réception de :3 http://archive-4.kali.org/kali kali-rolling/main amd64 Contents (deb) [45,3 MB]
Réception de :4 http://archive-4.kali.org/kali kali-rolling/contrib amd64 Packages [118 kB]
Réception de :5 http://archive-4.kali.org/kali kali-rolling/contrib amd64 Contents (deb) [227 kB]
30,3 Mo réceptionnés en 52s (584 ko/s)
Lecture des listes de paquets…

-----------------------------
sudo apt-get dist-upgrade -Vy
-----------------------------

Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
Calcul de la mise à jour…
Les paquets suivants seront mis à jour :
   code-oss (1.75.1-0kali1 => 1.82.2+ds-0kali1)
   geoclue-2.0 (2.7.0-3 => 2.7.1-1)
   ghidra (10.3.2-0kali1 => 10.3.3-0kali1)
   libapache2-mod-php8.2 (8.2.7-1 => 8.2.10-2)
   libcephfs2 (16.2.11+ds-2 => 16.2.11+ds-3)
   librados2 (16.2.11+ds-2 => 16.2.11+ds-3)
   php8.2 (8.2.7-1 => 8.2.10-2)
   php8.2-cli (8.2.7-1 => 8.2.10-2)
   php8.2-common (8.2.7-1 => 8.2.10-2)
   php8.2-mysql (8.2.7-1 => 8.2.10-2)
   php8.2-opcache (8.2.7-1 => 8.2.10-2)
   php8.2-readline (8.2.7-1 => 8.2.10-2)
   python3-django (3:3.2.20-1.1 => 3:3.2.21-1)
   ruby-cms-scanner (0.13.8-0kali5 => 0.13.9-0kali1)
14 mis à jour, 0 nouvellement installés, 0 à enlever et 0 non mis à jour.
Il est nécessaire de prendre 397 Mo dans les archives.
Après cette opération, 31,4 Mo d'espace disque supplémentaires seront utilisés.
Réception de :1 http://http.kali.org/kali kali-rolling/main amd64 code-oss amd64 1.82.2+ds-0kali1 [84,4 MB]
Réception de :2 http://archive-4.kali.org/kali kali-rolling/main amd64 geoclue-2.0 amd64 2.7.1-1 [124 kB]
Réception de :3 http://archive-4.kali.org/kali kali-rolling/main amd64 ghidra amd64 10.3.3-0kali1 [301 MB]
Réception de :4 http://archive-4.kali.org/kali kali-rolling/main amd64 php8.2-readline amd64 8.2.10-2 [12,4 kB]
Réception de :5 http://archive-4.kali.org/kali kali-rolling/main amd64 php8.2-opcache amd64 8.2.10-2 [346 kB]
Réception de :6 http://archive-4.kali.org/kali kali-rolling/main amd64 php8.2-mysql amd64 8.2.10-2 [117 kB]
Réception de :7 http://archive-4.kali.org/kali kali-rolling/main amd64 libapache2-mod-php8.2 amd64 8.2.10-2 [1 666 kB]
Réception de :8 http://archive-4.kali.org/kali kali-rolling/main amd64 php8.2-cli amd64 8.2.10-2 [1 725 kB]
Réception de :9 http://archive-4.kali.org/kali kali-rolling/main amd64 php8.2-common amd64 8.2.10-2 [673 kB]
Réception de :10 http://http.kali.org/kali kali-rolling/main amd64 librados2 amd64 16.2.11+ds-3 [3 326 kB]
Réception de :11 http://http.kali.org/kali kali-rolling/main amd64 libcephfs2 amd64 16.2.11+ds-3 [735 kB]
Réception de :12 http://archive-4.kali.org/kali kali-rolling/main amd64 php8.2 all 8.2.10-2 [31,4 kB]
Réception de :13 http://archive-4.kali.org/kali kali-rolling/main amd64 python3-django all 3:3.2.21-1 [2 827 kB]
Réception de :14 http://archive-4.kali.org/kali kali-rolling/main amd64 ruby-cms-scanner all 0.13.9-0kali1 [34,3 kB]
apt-listchanges : Lecture des fichiers de modifications (« changelog »)...
397 Mo réceptionnés en 11min 13s (590 ko/s)
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
(Lecture de la base de données... 467073 fichiers et répertoires déjà installés.)
Préparation du dépaquetage de .../00-code-oss_1.82.2+ds-0kali1_amd64.deb ...
Dépaquetage de code-oss (1.82.2+ds-0kali1) sur (1.75.1-0kali1) ...
Préparation du dépaquetage de .../01-geoclue-2.0_2.7.1-1_amd64.deb ...
Dépaquetage de geoclue-2.0 (2.7.1-1) sur (2.7.0-3) ...
Préparation du dépaquetage de .../02-ghidra_10.3.3-0kali1_amd64.deb ...
Dépaquetage de ghidra (10.3.3-0kali1) sur (10.3.2-0kali1) ...
Préparation du dépaquetage de .../03-php8.2-readline_8.2.10-2_amd64.deb ...
Dépaquetage de php8.2-readline (8.2.10-2) sur (8.2.7-1) ...
Préparation du dépaquetage de .../04-php8.2-opcache_8.2.10-2_amd64.deb ...
Dépaquetage de php8.2-opcache (8.2.10-2) sur (8.2.7-1) ...
Préparation du dépaquetage de .../05-php8.2-mysql_8.2.10-2_amd64.deb ...
Dépaquetage de php8.2-mysql (8.2.10-2) sur (8.2.7-1) ...
Préparation du dépaquetage de .../06-libapache2-mod-php8.2_8.2.10-2_amd64.deb ...
Dépaquetage de libapache2-mod-php8.2 (8.2.10-2) sur (8.2.7-1) ...
Préparation du dépaquetage de .../07-php8.2-cli_8.2.10-2_amd64.deb ...
Dépaquetage de php8.2-cli (8.2.10-2) sur (8.2.7-1) ...
Préparation du dépaquetage de .../08-php8.2-common_8.2.10-2_amd64.deb ...
Dépaquetage de php8.2-common (8.2.10-2) sur (8.2.7-1) ...
Préparation du dépaquetage de .../09-librados2_16.2.11+ds-3_amd64.deb ...
Dépaquetage de librados2 (16.2.11+ds-3) sur (16.2.11+ds-2) ...
Préparation du dépaquetage de .../10-libcephfs2_16.2.11+ds-3_amd64.deb ...
Dépaquetage de libcephfs2 (16.2.11+ds-3) sur (16.2.11+ds-2) ...
Préparation du dépaquetage de .../11-php8.2_8.2.10-2_all.deb ...
Dépaquetage de php8.2 (8.2.10-2) sur (8.2.7-1) ...
Préparation du dépaquetage de .../12-python3-django_3%3a3.2.21-1_all.deb ...
Dépaquetage de python3-django (3:3.2.21-1) sur (3:3.2.20-1.1) ...
Préparation du dépaquetage de .../13-ruby-cms-scanner_0.13.9-0kali1_all.deb ...
Dépaquetage de ruby-cms-scanner (0.13.9-0kali1) sur (0.13.8-0kali5) ...
Paramétrage de ruby-cms-scanner (0.13.9-0kali1) ...
Paramétrage de php8.2-common (8.2.10-2) ...
Paramétrage de librados2 (16.2.11+ds-3) ...
Paramétrage de python3-django (3:3.2.21-1) ...
Paramétrage de code-oss (1.82.2+ds-0kali1) ...
Paramétrage de php8.2-mysql (8.2.10-2) ...
Paramétrage de php8.2-opcache (8.2.10-2) ...
Paramétrage de php8.2-readline (8.2.10-2) ...
Paramétrage de geoclue-2.0 (2.7.1-1) ...
Installation de la nouvelle version du fichier de configuration /etc/apparmor.d/usr.libexec.geoclue ...
geoclue.service is a disabled or a static unit not running, not starting it.
Paramétrage de libcephfs2 (16.2.11+ds-3) ...
Paramétrage de ghidra (10.3.3-0kali1) ...
Paramétrage de php8.2-cli (8.2.10-2) ...
Paramétrage de libapache2-mod-php8.2 (8.2.10-2) ...
libapache2-mod-php8.2: not switching MPM - already enabled
Paramétrage de php8.2 (8.2.10-2) ...
Traitement des actions différées (« triggers ») pour mailcap (3.70+nmu1) ...
Traitement des actions différées (« triggers ») pour kali-menu (2023.4.5) ...
Traitement des actions différées (« triggers ») pour desktop-file-utils (0.26-1) ...
Traitement des actions différées (« triggers ») pour libc-bin (2.37-10) ...
Traitement des actions différées (« triggers ») pour man-db (2.11.2-3) ...
Traitement des actions différées (« triggers ») pour dbus (1.14.10-1) ...
Traitement des actions différées (« triggers ») pour shared-mime-info (2.2-1) ...
Traitement des actions différées (« triggers ») pour php8.2-cli (8.2.10-2) ...
Traitement des actions différées (« triggers ») pour libapache2-mod-php8.2 (8.2.10-2) ...

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

                  DATE :       LOC : ven. 29 sept. 2023 10:09:45 CEST - Europe/Paris (CEST, +0200)
                               UTC : ven. 29 sept. 2023 08:09:45 UTC

     DUREE D'EXECUTION :  SECONDES : 830
                         * MINUTES : 13
                          * HEURES : 0

      MODE D'EXECUTION :         - : TEST

SYSTEME D'EXPLOITATION :   VERSION : 2023.3

----------------------------
Fin de l'exécution du script
----------------------------
```
