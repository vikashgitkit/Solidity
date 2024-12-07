// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// There are 4 steps to verify the signature
// 1. msg to sign
// 2. hash(msg)
// 3. sign(hash(msg), private key) | offchain
// 4. ecrecover(hash(msg), signature) == signer

contract VerifySig {
    function verify(
        address _signer,
        string memory _message,
        bytes memory _sig
    ) external pure returns (bool) {
        //(2) hash the msg using keccack256
        bytes32 messageHash = getMessageHash(_message);

        //(3) sign hash msg
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);

        return recover(ethSignedMessageHash, _sig) == _signer;
    }
}
