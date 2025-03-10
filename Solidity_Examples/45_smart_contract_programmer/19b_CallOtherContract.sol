// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CallTestContract {
    //1st way
    function setX(TestContract _test, uint _x) external {
        _test.setX(_x);
    }   
    //2nd way
    function getX(address _test) external view returns(uint){
        uint x = TestContract(_test).getX();
        return x;
    }

    function setXandSendEther(address _test, uint _x) external payable {
        TestContract(_test).setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _test) external view returns(uint, uint) {
        (uint x, uint value) = TestContract(_test).getXandValue();
        return(x, value);
    }

}

contract TestContract {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns(uint, uint) {
        return (x, value);
    }
}