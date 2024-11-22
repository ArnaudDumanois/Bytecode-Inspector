// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageContract2 {

    string public to_ret= "Hello from the SmartContract";

    function getMessage() public view returns (string memory) {
        return to_ret;
    }
}