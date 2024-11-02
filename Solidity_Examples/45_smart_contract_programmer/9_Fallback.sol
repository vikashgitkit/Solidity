// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// fallback functionality
// -It is executed when a non existent func is called on the contract.
// -It is required to be marked external.
// -It has no name.
// -It has no arguments.
// -It can not return any thing.
// -It can be defined one per contract.
// -If not marked payable, it will throw exception if contract receives ether.
// -It's main use is to directly send the Eth to contract.
// -Receive only excepts payable, not data.

contract Fallback_receive {
    fallback() external payable {}

    receive() external payable {}

    function checkBal() public view returns (uint) {
        return address(this).balance;
    }
}
