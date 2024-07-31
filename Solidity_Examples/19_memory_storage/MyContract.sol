// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/memory-vs-storage

pragma solidity ^0.8.20;

contract MyContract {
    //storage
    string firstName;
    string lastName;

    constructor(string memory _firstName, string memory _lastName) {
        firstName = _firstName;
        lastName = _lastName;
    }

    function fullName() public view returns(string memory) {
        return string(abi.encodePacked(lastName, " ", firstName ));
    }


}