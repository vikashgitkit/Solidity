// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewPure {
    uint public num;

    //View can only read data from blockchain but not write
    function viewFun() external view returns (uint) {
        return num;
    }

    //Pure can't even read the data from the blockchain nor write
    function pureFunc() external pure returns (uint) {
        return 1;
    }

    function addToNum(uint x) external view returns (uint) {
        return x + num;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}
