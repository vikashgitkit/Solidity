// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract MyToken is ERC20, ERC721Holder {
    IERC721 public nft;
    mapping(uint256 => address) public tokenOwnerOf; //tokenId => address of user
    mapping(uint256 => uint256) public tokenStakedAt; //tokenId => block.timestamp
    uint256 public EMISSION_RATE = (50 * 10 ** decimals()) / 1 days;

    constructor(address _nft) ERC20("MyToken", "MTK") {
        nft = IERC721(_nft);
    }

    // function mint(address to, uint256 amount) public  {
    //     _mint(to, amount);
    // }

    function stake(uint256 tokenId) external {
        nft.safeTransferFrom(msg.sender, address(this), tokenId);
        tokenOwnerOf[tokenId] = msg.sender;
        tokenStakedAt[tokenId] = block.timestamp;
    }

    function calculateTokens(uint256 tokenId) public view returns (uint256) {
        uint256 timeElapsed = block.timestamp - tokenStakedAt[tokenId];
        return timeElapsed * EMISSION_RATE;
    }

    function unStake(uint256 tokenId) external {
        require(tokenOwnerOf[tokenId] == msg.sender, "You can't unstake");
        _mint(msg.sender, calculateTokens(tokenId));
        nft.transferFrom(address(this), msg.sender, tokenId);

        delete tokenOwnerOf[tokenId];
        delete tokenStakedAt[tokenId];
    }
}
