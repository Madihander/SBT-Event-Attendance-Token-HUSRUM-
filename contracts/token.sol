// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyToken is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    event Attest(address indexed to, uint256 indexed tokenId);
    event Revoke(address indexed to, uint256 indexed tokenId);

    uint index =0;
    string [3] uris = [
        "ipfs://xQmcWieLf2VR6XyFa7nb7venxFzCcdyStEucETvFt6hZpBT",
        "ipfs://Qmdi1bjUMP7g77YGSZJN3ptmoTKhqUFDFmG3C46ZAeBhBK",
        "ipfs://QmVNF1oppYfeiGt1B6Nvs22Q1EaGSVBVn8n5WKuhpHWosN"
    ];

    constructor() ERC721("MyToken", "MTK") {}

    function safeMint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, 'ipfs://QmeM26oyAnDGgBLNa3WaRQpcE3gbjjHPmb3gsdzhsu1cGM');
        index++;
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256, /* firstTokenId */
        uint256 batchSize
    ) internal override virtual {
        require(from == address(0) || to == address(0), "You can't transfer this token");
    }

     function _afterTokenTransfer(
        address from,
        address to,
        uint256 firstTokenId,
        uint256 batchSize
    ) internal override virtual {
        if(from == address(0)) {
            emit Attest(to,firstTokenId);
        } else if (to == address(0)) {
            emit Revoke(to,firstTokenId);
        }
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}