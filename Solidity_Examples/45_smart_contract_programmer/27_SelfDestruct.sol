// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//selfDestruct(Using this we can delete the contract from the blockchain)
// -Delete contract
// -Force send ether to any address

contract Kill {
    constructor() payable {}

    //Delete contract
    function killContract() external {
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns (uint) {
        return 123;
    }
}

//Force send ether to any address
contract Helperaddress {
    function getBal() external view returns (uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill.killContract();
    }
}
