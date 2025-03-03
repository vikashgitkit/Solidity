// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TestDelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) external payable {
        num = 2 * _num;
        sender = msg.sender;
        value = msg.value;
    }
}

//So using delegateCall as we are calling the setVars fn of
//testDelegateCall contract but the value(state variables) will be change in the DelegateCall contract not in TestDelegateCall contract
contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _test, uint _num) external payable {
        // _test.delegatecall(
        //     abi.encodeWithSignature("setVars(uint256)", _num)
        // );

        //Below line also do the same thing
        (bool success, bytes memory data) = _test.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        require(success, "DelegateCall failed");
    }
}
// delegatecall is essential for proxy contracts, modular design, and dynamic plugins.
// It allows for upgradability and efficient storage manipulation.
// It maintains the storage, msg.sender, and msg.value of the caller, unlike call.
