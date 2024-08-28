// SPDX-License-Identifier: MIT

/*
https://solidity-by-example.org/app/ether-wallet

An example of a basic wallet.

  Anyone can send ETH.
  Only the owner can withdraw.
*/

pragma solidity ^0.8.20;

contract EtherWallet {
    address payable public owner;

    constructor() payable{
        owner = payable(msg.sender);
    }

    function withdraw(uint256 amount) external {
        require(msg.sender == owner, "Only the owner can withdraw");
        payable(owner).transfer(amount);
    }

    function getBalance() external view returns(uint256) {
        return address(this).balance;
    }
}