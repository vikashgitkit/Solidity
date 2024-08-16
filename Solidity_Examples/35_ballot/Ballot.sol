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
}