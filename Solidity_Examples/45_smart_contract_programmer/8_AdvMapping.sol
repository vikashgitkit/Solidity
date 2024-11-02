// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

struct donor_dtls {
    string name;
    uint age;
    string addr_city;
    uint donation;
}

contract AdvMapping {
    mapping(address => donor_dtls) public acc_info;

    function set(
        string memory _name,
        uint _age,
        string memory _addr_city,
        uint _donation
    ) public {
        acc_info[msg.sender] = donor_dtls(
            _name,
            _age,
            _addr_city,
            acc_info[msg.sender].donation + _donation
        );
    }

    function delete_info() public {
        delete acc_info[msg.sender];
    }
}
