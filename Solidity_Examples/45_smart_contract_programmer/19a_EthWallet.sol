// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EtherWallet{
    address payable public owner;

    constructor() {
        owner = payable (msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amt) external {
        require(msg.sender == owner, "Caller is not owner");
        payable(msg.sender).transfer(_amt);

        // (bool sent, ) = msg.sender.call{value: _amt}("");
        // require(sent, "Failed to send ether");
    }

    function getBal() external view returns(uint) {
        return address(this).balance;
    }
}