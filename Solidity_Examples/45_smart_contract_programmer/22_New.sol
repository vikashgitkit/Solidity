// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Account {
    address public bank;
    address public owner;

    constructor(address _owner) payable {
        bank = msg.sender;
        owner = _owner;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

//We can deploy or create anothe contract using new keyword and as we are sending 111 wei which will send to the Account contract address.
contract AccountFactory {
    Account[] public accounts;
    function createAccount(address _owner) external payable {
        Account account = new Account{value: 111}(_owner);
        accounts.push(account);
    }
}
