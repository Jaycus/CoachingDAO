pragma solidity ^0.8.0;

import "./SafeMath.sol";
import "./Member.sol";

// The main contract representing the DAO
contract ClientCoachingDAO {
    using SafeMath for uint256;

    // A mapping from Ethereum addresses to Member structs
    mapping(address => Member) public members;
    // The Ethereum address of the contract owner
    address public owner;

    // The currency used by the DAO
    string public currency;

    // The exchange rate for the DAO's currency (in wei)
    uint256 public exchangeRate;

    // A function to initialize the DAO
    constructor(string memory _currency, uint256 _exchangeRate) public {
        owner = msg.sender;
        currency = _currency;
        exchangeRate = _exchangeRate;
    }

    // A function to allow a member to deposit funds into their balance
    function deposit(uint256 amount) public {
        // Get the member's address
        address memberAddress = msg.sender;

        // Get the member's struct
        Member storage member = members[memberAddress];

        // Update the member's balance
        member.balance = member.balance.add(amount);
    }

    // A function to allow a coach to withdraw funds from their balance
    function withdraw(uint256 amount) public {
        // Get the member's address
        address memberAddress = msg.sender;

        // Get the member's struct
        Member storage member = members[memberAddress];

        // Ensure the member is a coach
        require(member.isCoach, "Only coaches can withdraw funds");

        // Ensure the member has enough funds to withdraw
        require(member.balance.gte(amount), "Insufficient funds");

        // Update the member's balance
        member.balance = member.balance.sub(amount);

        // Transfer the funds to the member's Ethereum wallet
        member.memberAddress.transfer(amount);
    }

    // A function to allow a client to pay a coached for a lesson
    function payCoach(address coachedAddress, uint256 amount) public {
        // Get the client's address
        address clientAddress = msg.sender;

        // Get the client's struct
        Member storage client = members[clientAddress];

        // Ensure the client is a client
        require(!client.isCoach, "Only clients can pay coaches");

        // Ensure the client has enough funds to pay the coach
        require(client.balance.gte(amount), "Insufficient funds");

        // Get the coach's struct
        Member storage coached = members[coachedAddress];

        // Ensure the coached is a coach
        require(coached.isCoach, "Invalid coached address");

        // Update the client's balance
        client.balance = client.balance.sub(amount);

        // Update the coached's balance
        coached.balance = coached.balance.add(amount);

        // Transfer the funds to the coached's Ethereum wallet
        coached.memberAddress.transfer(amount);
    }

    // A function to allow the contract owner to add a new member to the DAO
    function addMember(address newMemberAddress, string memory name, bool isCoach) public {
        // Ensure the caller is the contract owner
        require(msg.sender == owner, "Only the owner can add new members");

        // Ensure the new member is not already a member of the DAO
        require(members[newMemberAddress].memberAddress == address(0), "Member already exists");

        // Initialize the new member's struct
        Member memory newMember = Member(newMemberAddress, name, isCoach, 0, 0);

        // Add the new member to the DAO
        members[newMemberAddress] = newMember;
    }

    // A function to allow the contract owner to remove a member from the DAO
    function removeMember(address memberAddress) public {
        // Ensure the caller is the contract owner
        require(msg.sender == owner, "Only the owner can remove members");

        // Get the member's struct
        Member storage member = members[memberAddress];

        // Ensure the member exists
        require(member.memberAddress != address(0), "Member does not exist");

        // Remove the member from the DAO
        delete members[memberAddress];
    }

    // A function to allow a member to update their name
    function updateName(string memory name) public {
        // Get the member's address
        address memberAddress = msg.sender;

        // Get the member's struct
        Member storage member = members[memberAddress];

        // Update the member's name
        member.name = name;
    }

    // A function to allow a member to update their reputation
    function updateReputation(uint256 reputation) public {
        // Get the member's address
        address memberAddress = msg.sender;

        // Get the member's struct
        Member storage member = members[memberAddress];

        // Ensure the member is a coach
        require(member.isCoach, "Only coaches can update their reputation");

        // Update the member's reputation
        member.reputation = reputation;
    }

    // A function to allow the contract owner to set the exchange rate for the DAO's currency
    function setExchangeRate(uint256 _exchangeRate) public {
        // Ensure the caller is the contract owner
        require(msg.sender == owner, "Only the owner can set the exchange rate");

        // Update the exchange rate
        exchangeRate = _exchangeRate;
    }
}