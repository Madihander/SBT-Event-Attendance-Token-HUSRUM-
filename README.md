# SBT-Event-Attendance-Token-HUSRUM-
# Project description
## Our team chose Task 3: Task 3: The Road Towards Decentralised Society. 
The problems of this task have been implemented. As such we do not have a visual representation of the solution to this task. We were not able to implement the front in its entirety, only a small part of it.

### Idea:
Create a notional marketplace where companies would put up advertisements with their events.

For attending such an event, the participant will receive an SBT token, which will contain data about the past event.

  

  

### The algorithm for our project:
  

#### 1 Step - Receiving SBT-NFT "event"

The user uses a smart contract located on the website to become a member. The smart contract accepts the address of the prospective participant. The new participant is given an SBT-NFT token. When the participant arrives at the event, they are required to show the event administration that they have a "verification" token.
Then the administration will ask for the participant's wallet address and then the smart contract responsible for distributing NFT-SBT "event" will transfer it to the participant (At the moment we couldn't implement a bot - only the administrator can transfer tokens).  

To implement the SBT token, the _afterTokenTransfer and beforeTokenTransfer functions have been changed
so that it is only possible to send this token once and no more can be transmitted.
And this possibility is lost when a token is sent to an event participant.  
The NFT-SBT token itself has properties: year, name, event and city.
(They used to try to store the hash, but for some reason the properties were not saved when the NFT-SBT was transferred to the participant. And the token was empty).  

==SBT token and its principles implemented==  
![Image alt](https://github.com/Madihander/SBT-Event-Attendance-Token-HUSRUM-/blob/main/Image%20for%20ReadME/Ver-1.png)
![Image alt](https://github.com/Madihander/SBT-Event-Attendance-Token-HUSRUM-/blob/main/Image%20for%20ReadME/Ver-2.png)

##### 2 Step - Checking the availability of the token

NFT-SBT of the event stores the following properties: year, event name, organiser, city.
These properties will be used to build a merkle tree (I am using a smart Hashing contract).
For ZKP protocol, the checker will use ZKP smart contract. It will accept:
1. the string that the checker wants to check if it exists in the merkle tree leaves(This is written by the sender himself the following data will be passed from the prover).
2. The index of this string in the merkle tree leaves.
3. the root of the merkle tree.
4. and 2 hash values which will be passed as an array.  

  

The meaning of this function is that the checker wants to know if the proving person was at the event. The prover sends the data index of this value, the root of the merkle and hash tree. The function will hash the resulting string. And if we can get the merkle tree root passed in. Then it will be considered that the participant was at the event and the real token. 

The checker knows nothing but the name of the event (public data), which he himself wants to check.
All data the prover gives (private data), the checker can not know if it is true or not.
The proving person needs to know how the merkle tree is built to prove that he has an "event" token.

==Zero-knowledge proof protocol and its principles - implemented.==
![Image alt](https://github.com/Madihander/SBT-Event-Attendance-Token-HUSRUM-/blob/main/Image%20for%20ReadME/SBT-1.png)
![Image alt](https://github.com/Madihander/SBT-Event-Attendance-Token-HUSRUM-/blob/main/Image%20for%20ReadME/SBT-2.png)
![Image alt](https://github.com/Madihander/SBT-Event-Attendance-Token-HUSRUM-/blob/main/Image%20for%20ReadME/SBT-3.png)
