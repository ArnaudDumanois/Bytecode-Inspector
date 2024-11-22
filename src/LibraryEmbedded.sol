// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Déclaration de la bibliothèque
library MessageLibrary {
    function getMessage() internal pure returns (string memory) {
        return "Hello from the SmartContract"; // La chaîne ici
    }
}

// Contrat utilisant la bibliothèque embarquée
contract LibraryEmbedded {
    using MessageLibrary for *; // Utilisation de la bibliothèque

    function getMessage() public pure returns (string memory) {
        return MessageLibrary.getMessage();
    }
}
