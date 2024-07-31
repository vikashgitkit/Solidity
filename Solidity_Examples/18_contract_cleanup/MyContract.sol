// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/contract-clean-up

pragma solidity ^0.8.20;

contract MyContract {

    address payable owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function kill() public {
        require(msg.sender == owner, "Only the owner can kill the contract");
        selfdestruct(owner);
    }
}