// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "hardhat/console.sol";

/**
 * @title Voting
 * @dev A smart contract for a simple electronic voting system.
 * The contract owner (chairperson) has the authority to register voters
 * and add candidates. Registered voters can cast one vote each.
 */
contract Voting {
    // Address of the person who deployed the contract (the "chairperson")
    address public owner;

    // A simple struct to store candidate details
    struct Candidate {
        string name;
        uint voteCount;
    }

    // A simple struct to store voter details
    struct Voter {
        bool isRegistered; // True if this address is allowed to vote
        bool hasVoted;     // True if this address has already cast a vote
        uint vote;         // The index of the candidate they voted for
    }

    // State Variables

    // A dynamic array to store all candidates
    Candidate[] public candidates;

    // A mapping to look up voter status by their address
    mapping(address => Voter) public voters;

    // Events
    event VoterRegistered(address indexed voter);
    event CandidateAdded(uint indexed candidateId, string name);
    event VoteCast(address indexed voter, uint indexed candidateId);

    /**
     * @dev Modifier to restrict certain functions to only the contract owner.
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    /**
     * @dev Contract constructor. Sets the deployer as the owner.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Add a new candidate to the election.
     * @dev Can only be called by the contract owner.
     * @param _name The name of the new candidate.
     */
    function addCandidate(string memory _name) public onlyOwner {
        require(bytes(_name).length > 0, "Candidate name cannot be empty.");
        uint candidateId = candidates.length;
        candidates.push(Candidate(_name, 0));
        emit CandidateAdded(candidateId, _name);
    }

    /**
     * @notice Register a new voter.
     * @dev Can only be called by the contract owner.
     * @param _voterAddress The Ethereum address of the person to register.
     */
    function registerVoter(address _voterAddress) public onlyOwner {
        require(!voters[_voterAddress].isRegistered, "Voter is already registered.");
        voters[_voterAddress].isRegistered = true;
        emit VoterRegistered(_voterAddress);
    }

    /**
     * @notice Cast a vote for a candidate.
     * @dev Can only be called by a registered voter who has not yet voted.
     * @param _candidateId The index of the candidate to vote for.
     */
    function vote(uint _candidateId) public {
        // 1. Check if the voter is registered
        require(voters[msg.sender].isRegistered, "You are not registered to vote.");
        
        // 2. Check if the voter has already voted
        require(!voters[msg.sender].hasVoted, "You have already cast your vote.");

        // 3. Check if the candidate ID is valid
        require(_candidateId < candidates.length, "Invalid candidate ID.");

        // All checks passed. Record the vote.
        voters[msg.sender].hasVoted = true;
        voters[msg.sender].vote = _candidateId;
        candidates[_candidateId].voteCount++;

        emit VoteCast(msg.sender, _candidateId);
    }

    /**
     * @notice Get the full list of all candidates.
     * @dev This is a public view function for the frontend.
     * @return A dynamic array of Candidate structs.
     */
    function getAllCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    /**
     * @notice Get the voter details for a specific address.
     * @dev This is a public view function for the frontend.
     * @param _voterAddress The address to check.
     * @return The Voter struct for that address.
     */
    function getVoter(address _voterAddress) public view returns (Voter memory) {
        return voters[_voterAddress];
    }
}
