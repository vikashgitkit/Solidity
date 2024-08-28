// SPDX-License-Identifier: MIT

/*
https://solidity-by-example.org/app/multi-sig-wallet

Let's create an multi-sig wallet. Here are the specifications.

The wallet owners can:
  submit a transaction
  approve and revoke approval of pending transcations
  anyone can execute a transcation after enough owners has approved it.
*/

pragma solidity ^0.8.20;

contract MultiSigWallet{

     event Deposit(address indexed sender, uint256 amount, uint256 balance);
    event SubmitTransaction(
        address indexed owner,
        uint256 indexed txIndex,
        address indexed to,
        uint256 value,
        bytes data
    );
    event ConfirmTransaction(address indexed owner, uint256 indexed txIndex);
    event RevokeConfirmation(address indexed owner, uint256 indexed txIndex);
    event ExecuteTransaction(address indexed owner, uint256 indexed txIndex);

     address[] public owners;
    mapping(address => bool) public isOwner;
    uint256 public numConfirmationRequired;

    struct Transaction {
        address to;
        uint256 value;
        bytes data;
        bool executed;
        uint256 numConfirmations;
    }

    // mapping from tx index => owner => bool
    mapping(uint256 => mapping(address => bool)) public isConfirmed;

    Transaction[] public transactions;


}