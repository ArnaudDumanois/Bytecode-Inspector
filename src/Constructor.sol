// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor {
    string public MESSAGE;

    constructor() {
        MESSAGE = "Hello from the SmartContract";
    }
}
