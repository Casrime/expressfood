# expressfood

Vous venez d'être recruté par la toute jeune startup ExpressFood. Elle ambitionne de livrer des plats de qualité à domicile en moins de 20 minutes grâce à un réseau de livreurs à vélo.

ExpressFood vous livre à domicile en moins de 20 minutes !
ExpressFood vous livre à domicile en moins de 20 minutes !
Chaque jour, ExpressFood prépare 2 plats et 2 desserts à son QG en collaboration avec des chefs expérimentés. Ces plats sont conditionnés à froid puis transmis à des livreurs à domicile qui "maraudent" ensuite dans les rues en attendant une livraison. Dès qu'un client a commandé, l'un des livreurs (qui possède déjà les plats dans un sac) est missionné pour livrer en moins de 20 minutes.

Sur son application, ExpressFood propose à ses clients de commander un ou plusieurs plats et desserts. Les frais de livraison sont gratuits. Les plats changent chaque jour.

Une fois la commande passée, le client a accès à une page lui indiquant si un livreur a pris sa commande et le temps estimé avant livraison.

ExpressFood a besoin que vous conceviez sa base de données. Il s'agit de stocker notamment :

La liste des clients
La liste des différents plats du jour
La liste des livreurs, avec leur statut (libre, en cours de livraison) et leur position
La liste des commandes passées
...
Pour structurer votre réflexion, vous utiliserez UML et construirez une suite de diagrammes afin de modéliser les besoins de l’application et le diagramme de classe pour modéliser les entités de l'application. Une fois que les diagrammes vous satisferont, vous réaliserez le schéma de base de données MySQL correspondant, puis vous remplirez la base avec des premières valeurs fictives.

Vous veillerez à produire des schémas UML cohérents par rapport au cahier des charges et respectant les standards UML. Vous concevrez ensuite un schéma de base de données SQL adéquat.

Schémas demandés :

Diagrammes de cas d’utilisation (création d’une commande, ajout d’un plat du jour, livraison d’une commande)
Modèle de données
Diagramme de classes
Diagrammes de séquences (création d’une commande, ajout d’un plat du jour, livraison d’une commande)

Livrables
Un dossier contenant les diagrammes UML demandés au format PNG ou JPG ;
Un export de la base de données MySQL avec un jeu de données de démo au format SQL.
Pour faciliter votre passage devant le jury, déposez sur la plateforme, dans un dossier zip nommé “Titre_du_projet_nom_prénom”, avec tous les livrables du projet comme suit : Nom_Prénom_n° du livrable_nom du livrable__date de démarrage du projet. Cela donnera :

Nom_Prénom_1_diagrammes_UML_mmaaaa ;
Nom_Prénom_2_export_BDD_mmaaaa.
Par exemple, le premier livrable peut être nommé comme suit : Dupont_Jean_1_diagrammes_UML_012022.

# ExpressFood

## Diagrammes UML

## SQL

Init database
```console
mysql -u root < sql/data.sql
mycli -u root < sql/data.sql
```
