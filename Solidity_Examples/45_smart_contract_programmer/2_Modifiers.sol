// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FuncModifiers {
    uint256 public count;
    bool public paused;

    modifier whenNotPaused() {
        require(!paused, "Contract is paused");
        _;
    }

    function setPause(bool _pause) external {
        paused = _pause;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function dec() external whenNotPaused {
        count -= 1;
    }

    //input modifier
    modifier cap(uint _x) {
        require(_x < 100, "x>=100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    //Sandwitch modifier
    modifier sandWich() {
        count += 10;
        _;
        count *= 2;
    }

    function foo() external sandWich {
        count += 1;
    }
}
