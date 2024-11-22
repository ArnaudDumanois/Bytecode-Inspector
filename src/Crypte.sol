// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Crypte {
    function getEncryptedMessage() public pure returns (bytes memory) {
        return abi.encodePacked("Hello from the SmartContract");
    }
}
