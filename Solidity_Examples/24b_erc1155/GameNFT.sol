// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// https://www.youtube.com/watch?v=19SSvs32m8I&t=601s

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameItems is ERC1155 {
    uint256 public constant CHARIZARD = 0;
    uint256 public constant IVYSAUR = 1;
    uint256 public constant VENUSAUR = 2;
    uint256 public constant CHARMANDER = 3;

    constructor() ERC1155("https://ipfs.io/ipfs/bafybeihjjkwdrxxjnuwevlqtqmh3iegcadc32sio4wmo7bv2gbf34qs34a/{id}.json") {
        _mint(msg.sender, CHARIZARD, 100, "");
        _mint(msg.sender, IVYSAUR, 100, "");
        _mint(msg.sender, VENUSAUR, 100, "");
        _mint(msg.sender, CHARMANDER, 100, "");

    }

    function uri(uint256 tokenId) override public view returns(string memory) {
        return(
            string(abi.encodePacked(
                "https://ipfs.io/ipfs/bafybeihjjkwdrxxjnuwevlqtqmh3iegcadc32sio4wmo7bv2gbf34qs34a/",
                Strings.toString(tokenId),
                ".json"
            ))
        );
    }
}