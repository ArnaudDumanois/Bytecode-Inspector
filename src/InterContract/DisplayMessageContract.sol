// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./MessageContract2.sol";

contract DisplayMessageContract {
    function deployAndGetMessage() public returns (string memory) {
        MessageContract2 newContract = new MessageContract2();
        return newContract.getMessage();
    }
}
