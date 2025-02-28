// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ArrayReplaceLast {
    uint[] public arr = [1,2,3,4];

    //[1,2,3,4] -- remove(1) --> [1,4,3]
    //[1,4,3] -- remove(2) --> [1,4]
    function remove(uint _index) public {
        arr[_index] = arr[arr.length-1];
        arr.pop();
    }
}