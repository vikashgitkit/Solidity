// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/data-types-in-solidity-smart-contracts/

pragma solidity ^0.8.20;

contract MyContract {
    string public myString = "Hello";
    bytes32 public myBytes32 = "Hello";
    int256 public myInt = 1;
    uint256 public myUint = 3;
    uint8 public muUint8 = 4;
    address public myAddress = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;

    //function with local variable are stored in memory.
    //variables within functions have a declared data type
     function getValue() public pure returns(uint256) {
        uint256 value = 6;
        return value;
    }
}