// SPDX-License-Identifier: GPL-3.0
// 
pragma solidity 0.8.15;
 contract Hashing {
     bytes32[] public hashes;
     // In the constructor we will create a completely merkle tree 
    constructor(string[] memory _data) {
        // push hasded data in hashes
        // making merklee tree leaves 
        for(uint i = 0; i <_data.length; i++) {
            hashes.push(makeHash(_data[i]));
        }

        // we use count because on next levels reduces the number of hashes by 2
        // for this reason we use count to fill in the array correctly
        uint count = _data.length;
        // We will start with element 0 and then move on to element 4.
        // To do this we will use an offset
        uint offset =0;
        
        while(count > 0) {
            // In the internal for loop, we make new hashes for the next level.
            // For example we take 0 and 1 hash and get 4.
            for (uint i =0; i < count -1; i+=2) {
                hashes.push(keccak256(abi.encodePacked(hashes[offset + i], hashes[offset + i +1])));
            }
            // 
            offset += count;
            count = count /2;
        }
    }
     function show()public view returns(bytes32[] memory){
         return hashes;
     }
     function makeHash(string memory input) internal pure returns(bytes32) {
        return keccak256(abi.encodePacked(input));
    }
 }