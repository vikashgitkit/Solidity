// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//2 ways to protect from reentrancy
//(a)Reentrancy guard (b)update state before transfer the amt

contract Bank {
    mapping (address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

   
}