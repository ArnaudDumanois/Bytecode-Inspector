// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageContract {
    function getMessage() public pure returns (string memory) {
        return "Hello from the SmartContract";
    }
}

contract DeployerContract {
    function deployAndGetMessage() public returns (string memory) {
        MessageContract newContract = new MessageContract();
        return newContract.getMessage();
    }
}
