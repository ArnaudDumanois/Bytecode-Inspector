// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IAffichable {
    function afficher() external view returns (string memory);
}

contract Parent is IAffichable {
    function afficher() external pure override returns (string memory) {
        return "Je suis Parent";
    }
}

contract Enfant is IAffichable {
    function afficher() external pure override returns (string memory) {
        return "Je suis Enfant";
    }
}

contract TestInterfaceBinding {
    function tester(IAffichable obj) public view returns (string memory) {
        return obj.afficher(); // Liaison explicite via interface
    }
}
