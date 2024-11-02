// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Array {
    uint[] public nums = [1, 2, 3];
    uint[3] public numsFixed = [4, 5, 6];

    function examples() external {
        nums.push(4); //[1,2,3,4]
        uint x = nums[1]; //2
        nums[2] = 77; // [1,2,77,4]
        delete nums[1]; //[1,0,77,4]
        nums.pop(); //[1,0,77]
        uint len = nums.length;

        //create array in memory
        uint[] memory a = new uint[](5);
        a[1] = 123;
    }

    function returnArray() external view returns (uint[] memory) {
        return nums;
    }
}
