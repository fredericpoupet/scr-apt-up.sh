# scr-apt-up.sh

Script de mise à jour d'une distribution exploitant APT en tant que gestionnaire de paquets.

## Détails

- La mise à jour de la distribution est envisagée comme globale et optimisée : les paquets obsolètes sont supprimés ;
- L'effet recherché est l'obtention d'un outil facile à déployer et à mettre en œuvre afin de réaliser la montée de version des logiciels d'une façon standardisée ;
- Le résultat de la dernière exécution du script est enregistré dans le fichier **scr-apt-up.log** ;
- Le caractère "*" préfixant certains résultats précise qu'ils sont obtenus par calcul et non par lecture directe.

## Précisions

Le script exécute de manière séquentielle les commandes suivantes :

```
sudo apt-get update
```

Mise à jour de la liste des fichiers dans les dépôts APT du fichier /etc/apt/sources.list.

```
sudo apt-get dist-upgrade -Vy
```

Mise à jour de tous les paquets installés vers les dernières versions en installant de nouveaux paquets si nécessaire.

```
sudo apt-get autoremove -y
```
Suppression des paquets ainsi que leurs dépendances devenus inutiles. Les fichiers de configuration de ces paquets sont toutefois conservés.

```
sudo apt-get clean
```
Suppression de tous les paquets du dossier /var/cache/apt/archives.

## Révisions attendues

...

## Révisions réalisées

- [X] Suppression de la commande **sudo apt-get autoclean**, redondante avec la commande **sudo apt-get clean** ;
- [X] Intégration de l'horodatage et de la duré de l'exécution du script.

## Exemple de résultat

```
----------------------------------------------------------------------------------
-                                                                                -
-            SCRIPT : scr-apt-up.sh                                              -
-              DATE : 26/08/2023                                                 -
-            AUTEUR : Frédéric POUPET                                            -
-            SOURCE : https://github.com/fredericpoupet/scr-apt-up.sh            -
-                                                                                -
----------------------------------------------------------------------------------

------------------------------------------------------------
Informations relatives au démarrage de l'exécution du script
------------------------------------------------------------

                  DATE :      LOC : ven. 25 août 2023 14:42:51 CEST - Europe/Paris (CEST, +0200)
                              UTC : ven. 25 août 2023 12:42:51 UTC

           UTILISATEUR :      NOM : user

SYSTEME D'EXPLOITATION :      NOM : Kali GNU/Linux Rolling
                          VERSION : 2023.3
                         HOSTNAME : lin-kali-2023-2-000

-------------------
sudo apt-get update
-------------------

Atteint :1 http://archive-4.kali.org/kali kali-rolling InRelease
Lecture des listes de paquets…

-----------------------------
sudo apt-get dist-upgrade -Vy
-----------------------------

Lecture des listes de paquets…
Construction de l'arbre des dépendances…
Lecture des informations d'état…
Calcul de la mise à jour…
0 mis à jour, 0 nouvellement installés, 0 à enlever et 0 non mis à jour.

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

                  DATE :       LOC : ven. 25 août 2023 14:42:54 CEST - Europe/Paris (CEST, +0200)
                               UTC : ven. 25 août 2023 12:42:54 UTC

     DUREE D'EXECUTION :  SECONDES : 3
                         * MINUTES : 0
                          * HEURES : 0
```
