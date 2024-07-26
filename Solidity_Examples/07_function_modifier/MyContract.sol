// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/pure-and-view
pragma solidity ^0.8.20;

contract MyContract {
    address public owner;
    string private name;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not an owner");
        _;

    }

    function setName(string memory newName) public onlyOwner {
        name = newName;
    }

    function getName() public view returns(string memory) {
        return name;
    }
}