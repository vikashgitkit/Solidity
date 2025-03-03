// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//2 ways to protect from reentrancy
//(a)Reentrancy guard (b)update state before transfer the amt

contract Bank {
    mapping (address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external { //(a)use nonReentrant gaurd here
        uint256 bal = balances[msg.sender];

        require(bal > 0, "Balance 0");

           balances[msg.sender] = 0; //(b)update state just before transfer

        (bool success, ) = msg.sender.call{value: bal}("");
        require(success, "Failed to withdraw");
        
     
    }
}