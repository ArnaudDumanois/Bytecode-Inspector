// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Dynamic {
    function getMessage() public pure returns (string memory) {
        return string(abi.encodePacked("Hello", " from ", "the SmartContract"));
    }
}
