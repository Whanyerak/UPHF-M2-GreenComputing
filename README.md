# Green Computing | Application d'analyse et gestion des performances par processus

### Avant tout

Afin de pouvoir utiliser le script, il vous faudra placer le dossier contenant les fichiers de l'application à la racine de votre disque C: en gardant bien le nom UPHF-M2-GreenComputing.


### A INSTALLER

<p style='text-align: justify;'>
Afin de pouvoir intéragir avec le son, il est nécessaire d'installer un .dll pour Powershell.<br>
Pour cela, il faut exécuter le script **sound_utility_install.ps1**.<br>
L'installation se réalise automatiquement et vous serez prêt à utiliser l'application totale.
</p><br>

### Lancement

<p style='text-align: justify;'>
Afin de lancer l'application, il faut exécuter le script **main.ps1**. <br>
Celui-ci vous demandera d'autoriser l'exécution de deux scripts en tant qu'administrateur. Autorisez les et tout se passera bien.<br>
NB : les droits d'admin sont nécessaires pour pouvoir intéragir avec le wifi.
</p><br>

### V1 (actuelle)

<p style='text-align: justify;'>L'objectif de cette solution est d'analyser les applications utilisées par l'utilisateur et d'en optimiser la consommation d'énergie. Nous travaillons ici sous Windows avec le langage Powershell.<br><br>Powershell étant nativement fait pour intéragir avec l'OS et ses periphériques/fonctionnalités, cet outil nous paraissait le plus approprié à une telle application, notamment en terme de ressources et de gestion des processus. De plus Powershell est installé de base sous Windows 10, aucune grosse configuration supplémentaire n'est donc nécessaire pour son utilisation.<br><br>Pour ce faire, un premier script dont l'objectif est d'analyser les applications et leurs performances a été développé.<br><br></p>
<p style='text-align: justify;'>
L'application se compose de plusieurs scripts :
<ul>
	<li>Script_Only_One : analyse les applications qui sont lancées et lance le script Script_Analyse pour chaque application détectée en fonctionnement.</li>
	<li>Script_Analyse : analyse l'application lancée et écrit les infos processeurs dans un fichier associé dans le dossier WorkingFiles.</li>
	<li>Script_Set_Laptop : analyse les applications lancées et exécute le script setLaptop lorsqu'un application est détectée en fonctionneent.</li>
	<li>setLaptop : optimise le système en fonction des infos situées dans le fichier test.json.</li>
</ul><br>
</p>

<p style='text-align: justify;'>
Dans le fichier **test.json** on retrouve un jeu d'informations pour chaque application permettant de set le système. Ce fichier est actuellement un fichier de test comme son nom l'indique.<br>
L'application permet actuellement de set la luminosité, le wifi, le son, en fonction des infos données dans le fichier **test.json**.
</p>


### TODO V2

<p style='text-align: justify;'>
Afin d'optimiser le fonctionnement de ce script, d'autres informations pourraient être ajoutées au script d'analyse telles que la consommation de RAM, la moyenne d'utilisation de son et de luminosité, et l'enchainement de lancement des applications.<br>
Ces informations seraient alors traitées par un script qui constituerait les moyennes d'utilisation de chaque application pour chaque élément système et de les noter dans le fichier JSON qui serait alors de plus en plus précise sur les besoins système et utilisateur.<br>
Le scipt de set serait alors plus performant.<br><br>
</p>