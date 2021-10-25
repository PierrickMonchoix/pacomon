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