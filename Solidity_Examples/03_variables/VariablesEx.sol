// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/variables-in-solidity-smart-contracts/
pragma solidity ^0.8.20;

contract VariableEx {
      //state variable of data type unint declared called "storedData"
    //Data in this variable will be saved to the block chain
    uint256 public storeDate;

    function getResult() public pure returns (uint256) {
        //local variable
        uint256 a = 7;
        uint256 b = 3;

        uint256 result = a + b;
        return result;
    }

    function getSenderOfTransaction() public view returns(address) {
        //Access global variable
        return msg.sender;
    }

    function getChainId() public view returns(uint256) {
        //Access global variable
        return block.chainid;
    }
}