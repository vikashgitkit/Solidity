// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract TestCall {
    string public message;
    uint public x;

    event Log(string _message);

    fallback() external payable {
        emit Log("Fallback Called");
    }

    function foo(
        string memory _msg,
        uint _x
    ) external payable returns (bool, uint) {
        message = _msg;
        x = _x;
        return (true, 999);
    }
}
