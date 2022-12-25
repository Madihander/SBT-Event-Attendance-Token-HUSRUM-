// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ZKP {
    //["2022", "BNB-Chain x AITU","Astana Hub","Astana"];
    // "Astana Hub"
    // 2
    //0x935ce56ecdd96ac2186c86cc2561b24630c17863b518e26e64efa90b30a38bae === root
    //["0x7be16480cf409e09bea7307684bed60eb576441955bac9616f8d90e38e6fe5b5",
    //"0x76021082ceca39adc164fdac9205ad89ab990da2f78708e91f808961f73ccfe1"]
    function verify(string memory data, uint index, bytes32 root, bytes32[] memory proof) public pure returns(bool) {
//   H1-2      H3-4

// H1   H2   H3   H4

// TX1  TX2  TX3  TX4
        bytes32 hash = keccak256(abi.encodePacked(data));
        for(uint i = 0; i < proof.length; i++) {
            bytes32 element = proof[i];
            if(index % 2 == 0) {
                hash = keccak256(abi.encodePacked(hash, element));
            } else {
                hash = keccak256(abi.encodePacked(element, hash));
            }
            index = index / 2;
        }
        return hash == root;
    }
}