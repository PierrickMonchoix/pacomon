# Notes de patch 21.11.2 

## Creation d'une apk

On peut désormais créeer une apk en executant 'construire_apk.bat'.
L'apk créée est : 'build\app\outputs\apk\release\app-release.apk'.

## Liste excel verticales

Les listes excels seront maintenant verticales et non plus horizontales.
Les listes affectées sont : la liste des pacomons et la liste des elements de terrain.

## Taille de la carte totale différente de la taille de la carte vue (affichéee)

Les tailles de la carte "vue" sur l'écran et de la carte "totale" peuvent être différentes.

## Taille de la carte vue configurable

La taille de la carte "vue" est configurable dans 'assets\for_alex\database_run.xlsx' dans l'onglet 'donnees'.

## Taille de la carte totale automatique

La taille de la carte totale est libre et automatique. Il faut juste que la carte dans 'assets\for_alex\database_run.xlsx' 
dans l'onglet 'carte' soit bien rectangle (pas de trous!) 
La carte totale n'est pas forcément carré.

## Spawn de Hero

Hero spawn aux coordonnées indiquées dans 'assets\for_alex\database_run.xlsx' dans l'onglet 'donnees'.

## Optimisation du chargement

Le chargement est beaucoup plus rapide (environ 1s) et il y a une vraie page de chargement.


# Comment configurer

## Dans /assets/for_alex/database_run.xlsx:

1) Remplir la feuille "carte" avec les nom des element_terrains
2) Remplir la feuille "element_terrain" comme dans l'exemple

## Remarque:

Pour modifier la taille de la carte, modfier la variable "taille"
dans lib/modele/carte.dart  (ouvrir ce fichier avec le bloc note).

exemple:

"static const taille = 15;"

devient:

"static const taille = 12;"

# Regles de code

## MVP

model ---> presentation ---> vue
                ^          
                |
                |
               I/O

## Pour refresh une vue

On la reconstruit entierement (a partir de la presentation)
De toute facon, une vue ne doit rien stoquer dans notre medele