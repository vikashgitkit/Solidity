// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Return multiple outputs
//Named outputs
//Destructuring Assignment

contract funcOutputs {
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    function named() public pure returns (uint x, bool b) {
        return (1, true);
    }

    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructingAssignments() public pure {
        (uint x, bool b) = returnMany();
    }
}
