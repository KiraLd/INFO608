# INFO608

Vous pouvez utiliser cette commande pour récupérer le dépôt Git sur votre OS:
git clone https://github.com/KiraLd/INFO608.git

Si vous utilisez Windows vous pouvez cloner directement en appuyant sur le bouton "Clone in desktop" en bas à droite.

Nous utiliserons 4 branches pour gérer le projet:
-master: contient l'ensemble du code fonctionnel, mis à jour régulièrement
-Application: contient le code de l'application android
-BDD: contient tout ce qui concerne la base de données
-WebService: contient le code concernant la partie liaison application/base de donnés

Vous pouvez vous placer sur une branche avec la commande:
git checkout nomDeLaBranche

Pour déposer des fichiers, il y a 4 commandes à connaitre:

git pull: met à jour la branche courante(celle que vous avez choisit avec git checkout)

git add fichier: ajoute des fichiers au prochain commit(vous pouvez ajouter tout un dossier en une seule commande: git add dossier/*)

git commit: associe les fichiers ajouté à une description, vous pouvez préciser ce qui a été modifié et ajouté 

git push: envoi les commit vers le serveur, vos identifiants seront demandés à ce moment là

Vous ne devez pas commit/push sur la branche master, la branche master est réservé au code fonctionnel et cohérent avec toutes les autres branches.

Vous devez toujours utiliser git pull pour être sûr d'avoir les derniers fichiers mis à jour et surtout avant de push.

