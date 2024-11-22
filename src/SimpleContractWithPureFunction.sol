// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContractWithPureFunction {
    function getMessage() public pure returns (string memory) {
        return "Hello from the SmartContract";
    }
}
