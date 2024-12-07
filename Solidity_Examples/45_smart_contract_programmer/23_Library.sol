// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//Inside library we can't declare state variable
library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    //Find the index of the array
    function findIndex(
        uint[] storage arr,
        uint x
    ) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("Not found");
    }
}

contract TestArray {
    using ArrayLib for uint[];
    uint[] public arr = [3, 2, 1];

    function testFindIndex() external view returns (uint i) {
        // return ArrayLib.findIndex(arr, 2);
        //Below line do the same thing
        return arr.findIndex(2);
    }
}
