// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//2 ways to call parent function (1) direct (2) super keyword

contract E {
    event Log(string message);

    function foo() public virtual {
        emit Log("E.foo");
    }

    function bar() public virtual {
        emit Log("E.bar");
    }
}

contract F is E {
    function foo() public virtual override {
        emit Log("F.foo");
        E.foo(); //1st way
    }

    function bar() public virtual override {
        emit Log("F.bar");
        super.bar(); //2nd way
    }
}
