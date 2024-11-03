// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ERC20Contract {
    string public name;
    string public symbol;
    uint8 public immutable decimals;
    uint256 public immutable totalSupply;

    mapping(address => uint256) _balances;
    //Spender => (owner => no of tokens allowd to spend from the owners acc)
    mapping(address => mapping(address => uint256)) _allowance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approve(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _totalSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = 18;
        totalSupply = _totalSupply;
        _balances[msg.sender] = _totalSupply;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        require(_owner != address(0), "ZA");
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(
            (_balances[msg.sender] >= _value) && (_balances[msg.sender] > 0),
            "Not have enough balance"
        );
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
