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

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool) {
        require(_allowance[msg.sender][_from] >= _value, "Not allowd enough");
        require(
            (_balances[_from] >= _value) && (_balances[_from] > 0),
            "Not have enough balance"
        );
        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowance[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        require(_balances[msg.sender] >= _value, "Not have enought balance");
        _allowance[_spender][msg.sender] = _value;
        emit Approve(msg.sender, _spender, _value);
        return true;
    }

    function allowances(
        address _owner,
        address _spender
    ) public view returns (uint256) {
        return _allowance[_spender][_owner];
    }
}
