pragma solidity ^0.8.0;

import "./SafeMath.sol";

enum MemberType { Client, Coach }

// A struct to represent a client or coached in the DAO
struct Member {
  address memberAddress; // The Ethereum address of the member
  string name; // The name of the member
  MemberType type; // Whether the member is a coached or a client
  uint256 reputation; // The reputation of the member, determined by their participation in the DAO
  uint256 balance; // The balance of the member in the DAO's currency

  // Constructor function to initialize a new Member object
  constructor(address _memberAddress, string memory _name, MemberType _type) public {
    require(_memberAddress != address(0), "Member address cannot be null");
    memberAddress = _memberAddress;
    name = _name;
    type = _type;
    reputation = 0;
    balance = 0;
  }

  // Modifier to ensure that memberAddress is non-null
  modifier onlyNonNullAddress() {
    require(memberAddress != address(0), "Member address cannot be null");
    _;
  }

  // Function to allow members to receive their balance in the DAO's currency
  function payout() public onlyNonNullAddress {
    require(balance > 0, "Cannot payout with a balance of zero or less");
    memberAddress.transfer(balance);
    balance = 0;
  }
}
