// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Déclaration de la bibliothèque
library MessageLibraryDeployed {
    function getMessage() public pure returns (string memory) {
        return "Hello from the SmartContract"; // La chaîne ici
    }
}

// Contrat utilisant la bibliothèque embarquée
contract LibraryDeployed {
    address libraryAddress;

    // Initialiser avec l'adresse de la bibliothèque
    constructor(address _libraryAddress) {
        libraryAddress = _libraryAddress;
    }

    function getMessage() public returns (string memory) {
        // Appel à la bibliothèque via son adresse
        (bool success, bytes memory data) = libraryAddress.call(abi.encodeWithSignature("getMessage()"));
        require(success, "Library call failed");
        return abi.decode(data, (string));
    }
}
