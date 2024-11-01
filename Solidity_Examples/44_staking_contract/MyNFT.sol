// what we are going to do-:
//   (1) Create NFT sc
//   (2) Create Token sc
//   (3) Add OnERC721Received to token sc
//   (4) Record the timestamp of staking and unstaking to ditribute the freshly minted tokens

// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721 {
    uint256 public totalSupply;
    constructor() ERC721("MyNFT", "MNFT") {}

    function safeMint(address to) public {
        totalSupply++;
        _safeMint(to, totalSupply);
    }
}
