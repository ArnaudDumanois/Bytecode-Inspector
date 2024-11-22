# Bytecode-Inspector

Dans ce projet nous allons jouer avec le bytecode produit par le compilateur de solidity `solc`. Le but, dans un premier temps, est de voir jusqu'a quelle niveau nous pouvons retrouver une chaine de caracteres dans le bytecode d'un contrat.  

## Structure du projet

Le dossier `src` contient les contrats solidity que nous allons compiler et inspecter, ils sont tres simpliste et leur but est de servir de support pour pouvoir utiliser plusisurs fonctionnalité du langages

Dans le dossier `src/output_test` vous pouvez retrouver un ensemble de fichier que nous avons génerer simplement grace aux options de `solc` et le fichier `test.sol`, ces simplements pour vous montrer qu'elle sont toute les informations et fichier generable par `solc`. Un fichier markdown est disponible pour expliquer les differentes options de `solc` que nous avons utilisé.

Pour inspecter le bytecode nous avons creer un script python tres simpliste `src/inspect_bytecode.py` qui prend le bytecode le transforme en texte et vérifie la présence d'une chaine de caractere

Enfin tout les compte rendu sont disponible dans le dossier `docs` sous format markdown. 

## Note importante

Dans ce projet meme si nous vous avons présenté plusieurs option de compilation nous nous interreserons uniquement a l'option --bin pour obtenir un fichier binaires, les autres sont pour le moment juger hors scope de ce projet.