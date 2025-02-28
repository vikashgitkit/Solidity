// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/* Fallback executed when - (a) fn doesn't exist (b)Directly send eth 

fallback() or receive()?

      Eth is sent to contract
               |
          is msg.data empty?
               / \
            yes   No
            /      \
    receive exist?  fallback()
            / \
          yes  No
          /     \
    receive()   fallback()
    */
contract Fallback {
    event Log(string func, address sender, uint value, bytes data);
    fallback() external payable{
        emit Log("Fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }
}