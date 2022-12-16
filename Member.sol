pragma solidity ^0.8.0;

import "./SafeMath.sol";

// A struct to represent a client or coached in the DAO
struct Member {
address memberAddress; // The Ethereum address of the member
string name; // The name of the member
bool isCoach; // Whether the member is a coached or a client
uint256 reputation; // The reputation of the member, determined by their participation in the DAO
uint256 balance; // The balance of the member in the DAO's currency
}