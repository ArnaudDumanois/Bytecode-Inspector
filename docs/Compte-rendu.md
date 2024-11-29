# Compte rendu du 22/11/2024 

Ici nous avons inspecter plusieurs cas possible :

# Use case Simples

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

Nous utilisons la fonction `abi.encodePacked` pour encoder la chaine de caractere, cette fonction permet de concatener les valeurs passées en paramètre et de les encoder en hexadécimal. On peut voir que la chaine de caractere est bien présente dans le bytecode, et facilement retrouvable car dans tout les cas la chaine sera encodé en hexadécimal dans le bytecode, la seule différence est l'espace mémoire utilisé.

Donc on arrive a retrouvé la valeur

![alt text](image-4.png)

- library pour manipuler les chaines de caractere

Nous allons utiliser les **library** pour manipuler les chaines de caractere, une library est une sorte de contrat qui contient du code réutilisable, cependant elle ne peuvent pas déclarer de variables d'état, ni de fonctions payable. Une library est inclus dans un le contrat si toute les fonctions sont déclaré **internal** sinon elle doivent etre déployé et ensuite lié avant que le contrat soit déployé.

Dans le cas des library incluse, la compilation de cette derniere produit 2 binaire, un pour la libairie et un autre pour la librairie incluse dans le contrat.

![alt text](image-5.png)

Néanmoins on remarque qu'ici que l'on retrouve dans le bytecode du contrat la chaine de caractere puisqu'elle a été incluse dans le bytecode du contrat. Ce qui pose a se demandé pourquoi generer le bytecode de la Librairie ?

Dans le cas des library déployé, la compilation de cette derniere également 2 binaire, un pour la libairie et un autre pour le contrat qui utilise la librairie. On peut voir que la chaine de caractere est bien présente dans le bytecode de la librairie mais qu'elle n'est plus dans le bytecode du contrat.

![alt text](image-6.png)

- Appel Inter-contrats avec déploiement dynamique  

Si le contrat principal déploie un autre contrat à la volée et interagit avec lui, la chaîne sera dans le bytecode du contrat déployé.
Et on retrouve la phrase dans les 2. 
![alt text](image-7.png)

Cependant nous avons compilé a la volé avec un fichier contenant les 2 contrats, nous allons faire le cas avec un fichier pour chaque contrat. Nous allons simplement diviser en 2 fichiers les contrats dasn `./InterContract`.
Mais  on retrouve la chaine de caractere dans les 2 bytecodes

![alt text](image-8.png)

- Utilisation d'un constructeur pour initialiser la chaine de caractere

Si on inclut la chaîne dans un constructeur pour qu'elle soit immédiatement stockée dans le stockage lors du déploiement, on retrouve la phrase dans le bytecode

![alt text](image-9.png)

## Pause sur le Dynamic binding

Le dynamic binding est une technique de programmation qui permet de lier une fonction à un appel de fonction à l'exécution. 

Attention on ne doit pas le confondre avec le dynamic linking qui lui sert a lié les libraries.

Le dynamic binding est utilisé dans les langages de programmation orienté objet, pour permettre de lier une fonction à un appel de fonction à l'exécution. Cela permet de faire de la programmation orienté objet, et de permettre l'héritage, le polymorphisme, etc.

L'idée, en pseudo code, est d'observer le comportement suivant : 
```
Classe Parent {
    Méthode afficher() {
        Affiche "Je suis Parent"
    }
}

Classe Enfant hérite de Parent {
    Méthode afficher() {
        Affiche "Je suis Enfant"
    }
}

// Programme principal
Parent p = nouvel Enfant()
p.afficher()  // Quelle méthode est appelée ?
```

et on va s'intéresser a quelle méthode est appelée, et donc qu'est ce qui est affiché.
Si solidity supporte le dynamic binding, alors la méthode afficher de l'enfant sera appelée, et donc "Je suis Enfant" sera affiché, car l'objet p est certes de type Parent, mais il est en réalité un objet de type Enfant.
Sinon, c'est la méthode afficher du parent qui sera appelée, et donc "Je suis Parent" sera affiché car il se basera sur le type de l'objet p, et non sur le type réel de l'objet, on parlera de type statique.

On va se serviir du code du fichier /DynamicBinding/test_dynamicBinding.sol pour observer le comportement de Solidity, il s'agit simplement de l'implémentation du pseudo code ci-dessus. Et grace a RemixIDE, on peux voir que lorsqu'on appelle la fonction tester, c'est bien la fonction de l'enfant qui est appelée, et donc "Je suis Enfant" est affiché, ce qui signifie que Solidity supporte le dynamic binding.

![alt text](image-10.png)


## Use Case avancé

Dans la partie précédente nous avons simplement pu observer des comportements assez basique de langages de programmation, cependant Solidity est un langage de programmation qui permet de faire de la programmation orienté objet, nous allons donc voir comment se comporte le bytecode dans des cas plus avancé avec nottament la notion d'héritage.

- Heritage simple avec une fonction héritée  
- Rédéfinitions de fonction héritée
- Appel à une fonction d'un contrat parent avec super
- Appel d'un autre contrat via adresse
- Utilisation d'une interfaces avec une constante
- Heritage multiple
- Contrat abstrait 
- Heritage multiple et contrat abstrait



