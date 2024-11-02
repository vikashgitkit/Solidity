// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Declare a mapping (simple and nested)
//Set, get, delete

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function examples() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; //0

        balances[msg.sender] += 456;

        delete balances[msg.sender];

        isFriend[msg.sender][address(this)];
    }
}
