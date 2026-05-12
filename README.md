# DAO Voting Smart Contract

A decentralized DAO Voting Smart Contract built using Solidity that enables users to participate in proposal-based voting on the blockchain.

The contract allows an admin to create proposals while community members vote with a Yes / No mechanism. Each wallet can vote only once, and results are generated after the voting deadline.

## Overview

A DAO (Decentralized Autonomous Organization) is a blockchain-based governance system where decisions are made through voting instead of centralized control.

This project demonstrates how voting systems can be implemented on blockchain using Ethereum Smart Contracts.

## Workflow
Admin deploys the contract
Voting deadline is initialized
Admin creates a proposal
Users vote (Yes or No)
Each wallet can vote only once
Voting closes after deadline
Final result is displayed

## Features

1. Admin-only proposal creation
2. Voting deadline system
3. One wallet = one vote
4. Yes / No voting mechanism
5. Vote counting system
6. Voting restriction after deadline
7. Final proposal result system
8. Secure validation using require()

## Technologies Used
Solidity ^0.8.0
Ethereum
Remix IDE

## Project Structure
DAOVoting/
│── DAOVoting.sol
│── README.md

## Smart Contract Logic
  1. Contract Deployment 

When deployed:

Deployer becomes admin
Voting deadline is initialized

Example:

constructor(uint _duration)

Example input:

60

Meaning:

60 seconds voting duration

2. Proposal Creation

Only admin can create proposals.

Function:

function createProposal(string memory _description) public

Example proposal:

"Should we add staking?"

3. Voting System

Users vote using:

function vote(bool _vote) public

Vote options:

true = YES
false = NO

Conditions:

Voting must be active
User can vote only once

4. Result Function

Final voting result can be checked after deadline.

Function:

function getResult() public view returns(string memory)

Possible outputs:

Proposal Passed
Proposal Rejected
Tie

## How to Test in Remix
Step 1 — Deploy Contract

Input duration:

120

Meaning:

Voting lasts for 120 seconds

Step 2 — Create Proposal

Call:

createProposal()

Example input:

"Should we launch token?"

Step 3 — Vote

Call:

vote()

Input:

true

for YES

or

false

for NO

Use multiple Remix accounts to simulate DAO members.


Step 4 — Check Proposal

Call:

proposal

Check:

Description
Yes votes
No votes

Step 5 — Get Final Result

Wait until deadline ends.

Then call:

getResult()

Example output:

Proposal Passed

## Security Features
→Only admin can create proposals
→One wallet can vote only once
→Voting disabled after deadline
→Input validation using require()

## Future Improvements
→Multiple proposals support
→Voting power based on token holdings
→Proposal creation by community
→Event logging
→Frontend integration with React + Ethers.js

## Author

Noshock
