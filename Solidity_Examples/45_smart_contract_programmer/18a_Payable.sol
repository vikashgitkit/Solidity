// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Payable {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() external payable{} //able to send eth to this contract

    function getBal() external view returns(uint) {
        return address(this).balance;
    }
}