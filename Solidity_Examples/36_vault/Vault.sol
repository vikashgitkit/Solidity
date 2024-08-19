// SPDX-License-Identifier: GPL-3.0
//
// https://muens.io/how-to-implement-lp-tokens-in-solidity

pragma solidity >=0.7.0 <0.9.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Vault is ERC20{

    IERC20 public immutable token;

    constructor(IERC20 token_) ERC20("Liquidity Provider Token", "LP-TKN"){
        token = token_;
    }


     function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");

        uint256 amountToken = amount;
        uint256 supplyToken = this.totalSupply();
        uint256 balanceToken = token.balanceOf(address(this));

        uint256 amountLPToken;
        if(supplyToken == 0) {
            amountLPToken = amountToken;
        } else  {
            amountLPToken = (amountToken * supplyToken) / balanceToken;
        }

        _mint(msg.sender, amountLPToken);
        token.transferFrom(msg.sender, address(this), amountToken);
     }

}