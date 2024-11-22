# Résultat de la compilation

Pour compiler dans ce projet nous utilisons le compilateur solc (Solidity Compiler) qui est un compilateur Solidity en ligne de commande. Il est écrit en C++ et est disponible en tant que binaire exécutable pour Linux, Windows et Mac OS X.   

Ce dossier est simplement un exemple de compilation d'un smart contract ainsi que des fichiers que l'on peux obtenir avec

A la compilation on peut obtenir plusieurs fichiers en fonction des options que l'on donne au compilateur. Ceci est interessant a savoir 
meme si dans notre cas nous n'utilisons pas tous les fichiers générés. Mais principalement le --bin produisant le bytecode 

```bash
solc -o <output_directory> --bin --abi --devdoc --userdoc --metadata --ast-compact-json --opcodes --asm <input_file> --overwrite
```

 `--bin` : Le bytecode du contrat
 `--abi` : L'interface du contrat
 `--devdoc` : La documentation du développeur définit dans le contrat avec les commentaires de la forme `///`
 `--userdoc` : La documentation de l'utilisateur définit dans le contrat avec les commentaires de la forme `/**`
 `--metadata` : Les métadonnées du contrat
 `--ast-compact-json` : L'arbre de syntaxe abstraite
 `--opcodes` : Les opcodes du contrat
 `--asm` : L'assembleur du contrat
 `--overwrite` : Ecrase les fichiers de sortie existants
