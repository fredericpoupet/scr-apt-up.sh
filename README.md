# scr-apt-up.sh

Script de mise à jour d'une distribution exploitant APT en tant que gestionnaire de paquets.

## Détails

L'effet recherché est l'obtention d'un outil facile à déployer et à mettre en oeuvre afin de réaliser la montée de version des logiciels d'une façon standardisée.

## Précisions

Les script éxecute de manière séquentielle les commandes suivantes :

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
Suppression des paquets ainsi que leurs dépendances devenus inutiles.

```
sudo apt-get autoclean
```

Suppression des paquets obsoletes du dossier /var/cache/apt/archives.

```
sudo apt-get clean
```
Suppression de tous les paquets du dossier /var/cache/apt/archives.
