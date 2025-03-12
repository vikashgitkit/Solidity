// Sources flattened with hardhat v2.22.19 https://hardhat.org

// SPDX-License-Identifier: MIT

// File contracts/Transaction.sol

// Original license: SPDX_License_Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Transfer {
    event TransferEvent(address from, address to, uint amount);
    event ChangeNameEvent(string name);

    string public name="CTE";
    uint public id=1;

    function transfer(address payable to) public payable {
        to.transfer(msg.value);
        emit TransferEvent(msg.sender, to, msg.value);
    }

    function changeName(string calldata _name) public {
        name = _name;
        emit ChangeNameEvent(_name);
    }

    function changeId(string calldata _name) public {
        name = _name;
    }
}
