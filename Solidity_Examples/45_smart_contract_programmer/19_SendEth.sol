// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//3 ways to send ETH
//(1)transfer - 2300 gas, reverts
//(2)send - 2300 gas, returns bool (This is usually not used in mainnet)
//(3)call - all gas, returns bool and data
contract SendEther {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(111);
        require(sent, "Send failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 222}(""); //Recommended way
        require(success, "Call failed");
    }
}

//Will send Eth from SendEther contract to this EthReceiver contract
contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
