// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Parent {
    mapping(address => string) public roles;

    constructor() {
        roles[address(this)] = "Parent";
    }

    function afficher() public view returns (string memory) {
        return roles[address(this)];
    }
}

contract Enfant is Parent {
    constructor() {
        roles[address(this)] = "Enfant";
    }
}

contract TestCustomBinding {
    function tester() public returns (string memory) {
        Parent parent = new Enfant();
        return parent.afficher(); // Résolu via la table de dispatch
    }
}
