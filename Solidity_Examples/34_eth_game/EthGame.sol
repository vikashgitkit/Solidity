// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/deposit-14-eth-game-in-a-solidity-smart-contract/

pragma solidity ^0.8.20;

// A game where the 14th person that deposit ether wins all the ether in the contract
// the winner can claim the 14 ether

contract EthGame {
    uint256 public targetAmount = 14 ether;
    address public winner;

    uint256 public balance;

    function deposit() public payable {
        require(msg.value == 1 ether, "You can only send 1 ether");

        balance += msg.value;
        require(balance <= targetAmount, "Game is over");

        if(balance == targetAmount) {
            winner = msg.sender;
        }
    }

    function claimReward() public {
        require(msg.sender == winner, "Not a winner");

        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send ether");


    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}