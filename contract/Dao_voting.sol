// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DAOVoting {
    address public admin;
    uint public deadline;

    constructor(uint _duration) {
        admin = msg.sender;
        deadline = block.timestamp + _duration;

    }

    struct Proposal {
        string description;
        uint yesVotes;
        uint noVotes;
    }
    Proposal public proposal;

    function createProposal(string memory _description) public {
        require(msg.sender == admin, "only admin");
        proposal = Proposal(_description, 0, 0);
    }

    mapping(address => bool) public hasVoted;

    function vote(bool _vote) public {
        require(block.timestamp < deadline, "Voting ended");

        require(!hasVoted[msg.sender], "Already voted");

        hasVoted[msg.sender] = true;

        if(_vote) {
            proposal.yesVotes++;

        } else{
            proposal.noVotes++;
        }
    }

    function getResult() public view returns(string memory){

        require(block.timestamp >= deadline, "Voting still active");

        if(proposal.yesVotes > proposal.noVotes) {
            return "Proposal Rejected";

        }

        else if(proposal.noVotes > proposal.yesVotes) {
            return "Proposal Rejected";

        }
        else {
            return "tie";
        }
    }


}
