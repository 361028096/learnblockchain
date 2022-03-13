//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract MyERC721 is ERC721, Ownable  {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MyERC721", "MyERC721") {
         uint256 tokenId = _tokenIds.current();
         _tokenIds.increment();
        _mint(msg.sender, tokenId);
    }


    // function safeMint(address to) public onlyOwner {
    //     uint256 tokenId = _tokenIds.current();
    //     _tokenIds.increment();
    //     _safeMint(to, tokenId);
    // }
}