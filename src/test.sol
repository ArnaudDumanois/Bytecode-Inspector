// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    // add a variable
    string public message = "hello luigi";
    function sayHello() public pure returns (string memory) {
        return "Hello from the SmartContract";
    }
}
