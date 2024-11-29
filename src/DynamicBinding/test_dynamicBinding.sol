// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Parent {
    function afficher() public virtual returns (string memory) {
        return "Je suis Parent";
    }
}

contract Enfant is Parent {
    function afficher() public virtual override returns (string memory) {
        return "Je suis Enfant";
    }
}

contract TestDynamicBinding {
    function tester() public returns (string memory) {
        Parent parent = new Enfant(); // Type statique : Parent, Type dynamique : Enfant
        return parent.afficher(); // Quelle méthode sera appelée ?
    }
}
