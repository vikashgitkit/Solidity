// SPDX-License-Identifier: MIT
//
// https://docs.soliditylang.org/en/v0.8.15/solidity-by-example.html

pragma solidity >=0.7.0 <0.9.0;

contract Ballot {

      // This declares a new complex type which will be used for variables later. It will represent a single voter.
      struct Voter {
        uint256 weight; // weight is accumulated by delegation
        bool voted; // if true, that person already voted
        address delegate;  // person delegated to
        uint256 vote; // index of the voted proposal
      }

  // This is a type for a single proposal.
  struct Proposal {
    bytes32 name;  // short name (up to 32 bytes)
    uint256 voteCount; // number of accumulated votes
  }
  address public chairperson;

     // This declares a state variable that stores a `Voter` struct for each possible address.
     mapping(address => Voter) public voters;

     // A dynamically-sized array of `Proposal` structs.
     Proposal[] public proposals;

    // Create a new ballot to choose one of `proposalNames`
    constructor(bytes32[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
       
         // For each of the provided proposal names, create a new proposal object and add it to the end of the array.
         for(uint256 i = 0; i < proposalNames.length; i++) {
            // `Proposal({...})` creates a temporary
            // Proposal object and `proposals.push(...)`
            // appends it to the end of `proposals`.
            proposals.push(Proposal({name: proposalNames[i], 
            voteCount: 0}));
         }

    }

    
}