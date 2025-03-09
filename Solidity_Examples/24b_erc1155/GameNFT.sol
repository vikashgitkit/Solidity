// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//https://www.youtube.com/watch?v=ngxWWS3Qr3Q
//https://www.youtube.com/watch?v=J4p1sdo3Rz4&t=2s
// https://www.youtube.com/watch?v=19SSvs32m8I&t=601s

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameItems is ERC1155 {
    uint256 public constant CHARIZARD = 0;
    uint256 public constant IVYSAUR = 1;
    uint256 public constant VENUSAUR = 2;
     uint256 public constant CHARMANDER = 2;

    constructor() ERC1155("https://sapphire-raw-boar-315.mypinata.cloud/ipfs/bafkreig2lpxwqxmbhdb6hldboymhumltbkau7vxd6zsii6nqvncyxxlu5u/{id}.json") {
        _mint(msg.sender, CHARIZARD, 100, "");
        _mint(msg.sender, IVYSAUR, 100, "");
        _mint(msg.sender, VENUSAUR, 100, "");
        _mint(msg.sender, CHARMANDER, 100, "");

    }

    function uri(uint256 tokenId) override public view returns(string memory) {
        return(
            string(abi.encodePacked(
                "https://sapphire-raw-boar-315.mypinata.cloud/ipfs/bafkreig2lpxwqxmbhdb6hldboymhumltbkau7vxd6zsii6nqvncyxxlu5u",
                Strings.toString(tokenId),
                ".json"
            ))
        );
    }
}