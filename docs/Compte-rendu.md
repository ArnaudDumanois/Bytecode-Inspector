# Compte rendu du 22/11/2024 

Ici nous avons inspecter plusieurs cas possible :

- Contrat simple avec une fonction pure qui retourne la chaine de caractere  

La chaine est bien présente dans le bytecode, car elle fait partie des données statiques

![alt text](image.png)

- Chaine définis avec une constante 

La chaine est bien présente dans le bytecode, car les constantes sont intégrées directement intégré dans le bytecode

![alt text](image-1.png)

- Chaine définis avec une variable d'état 

La chaine est bien présente dans le bytecode, car les variables d'état sont stockées dans le storage.
Ma théorie est que Solidity doit generer un getter pour chaque variable d'état, et que le bytecode de la fonction doit contenir le code pour appeler ce getter.

![alt text](image-2.png)

- Contrat simple qui construit dynamiquement la chaine de caractere dans une fonction

Ici c'est un cas particulier, notre vérificateur python fait simplement une vérification de la présence de la chaine de caractere "Hello from the SmartContract" cependant dans ce cas la chaine de caractere est construite dynamiquement dans la fonction, ainsi, on peut retrouver cette chaine mais éclaté dans différentes partie du bytecode. Si on regarde bien on arrive a retrouver chaque bout de la phrase.

En modifiant legerement le script python pour afficher le binaire en gardant uniquement les caractere ASCII on voit qu'on arrive a retrouver des les éléments qui constitue notre phrase

![alt text](image-3.png)

- Chaine encrypté ou encodé
- library pour manipuler les chaines de caractere
- Utilisation d'un constructeur pour initialiser la chaine de caractere

- Heritage simple avec une fonction héritée  
- Rédéfinitions de fonction héritée
- Appel à une fonction d'un contrat parent avec super
- Appel d'un autre contrat via adresse
- Utilisation d'une interfaces avec une constante
- Heritage multiple
- Contrat abstrait 
- Heritage multiple et contrat abstrait



