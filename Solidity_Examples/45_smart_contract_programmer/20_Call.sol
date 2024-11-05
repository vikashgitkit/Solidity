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

contract Call {
    bytes public data;

    function callFoo(address _testCall) external payable {
        (bool success, bytes memory _data) = _testCall.call{
            value: 111,
            gas: 5000
        }(abi.encodeWithSignature("foo(string,uint256)", "Call foo", 123));
        require(success, "call failed");
        data = _data;
    }
}
