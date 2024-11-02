// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DataLocation {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function examples(
        uint[] calldata y,
        string calldata s
    ) external returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        //If want to change in the state variable value then use storage(in dynamic data type) and If you want to pass paramter variable in
        //some internal fn then use calldata and if only read the data from state variables then use memory.
        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo";

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 456; //This value will not save in state variable

        _internal(y);

        uint[] memory memArr = new uint[](3); //Fixed array
        memArr[0] = 234;
        return memArr;
    }

    function _internal(uint[] calldata y) private {
        uint x = y[0];
    }
}
