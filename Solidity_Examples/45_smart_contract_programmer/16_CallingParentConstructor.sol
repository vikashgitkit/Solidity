// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//2 ways to call parent constructors
//order of initialization

contract S {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T {
    string public text;
    constructor(string memory _text) {
        text = _text;
    }
}

//1st way if you want to pass the static values in the constructo
contract U is S("s"), T("t") {}

//2nd way
contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {}
}

//Or you can use the combination of both ways
contract UV is S("s"), T {
    constructor(string memory _text) T(_text) {}
}
