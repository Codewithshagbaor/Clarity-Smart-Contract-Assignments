## Assignment 2: Simple Voting System (Medium)

### Overview

Create a decentralized voting system where users can create proposals and vote on them. Each user gets one vote per proposal, and votes are final once cast. The contract tracks vote tallies and prevents double-voting.

### Learning Objectives

- Work with complex data structures
- Implement authorization and access control
- Prevent common vulnerabilities (double-voting)
- Manage proposal lifecycle states
- Use multiple maps for related data

### Requirements

**Data Structures:**

- Map for proposal details (id → proposal data)
- Map for vote tracking (proposal-id + voter principal → vote)
- Counter for total proposals created
- Store: proposal title, description, yes votes, no votes, end block height, creator

**Functions to Implement:**

1. **create-proposal** (public function)
    - Creates a new voting proposal
    - Parameters: title (string), description (string), voting-duration (uint in blocks)
    - Automatically assigns an incremental proposal ID
    - Sets end-block-height as current block + duration
    - Returns (ok proposal-id)
2. **vote** (public function)
    - Allows a user to cast a vote on an active proposal
    - Parameters: proposal-id (uint), vote-for (bool - true for yes, false for no)
    - Must check: proposal exists, voting is still open, user hasn't voted yet
    - Returns (ok true) on success
    - Error codes for: proposal not found, voting closed, already voted
3. **get-proposal** (read-only function)
    - Retrieves all details about a proposal
    - Parameter: proposal-id
    - Returns proposal data including current vote counts
4. **has-voted** (read-only function)
    - Checks if a specific user has voted on a proposal
    - Parameters: proposal-id, user principal
    - Returns true or false
5. **get-vote-totals** (read-only function)
    - Returns the current yes and no vote counts for a proposal
    - Parameter: proposal-id
    
**Test Cases:**

- Create multiple proposals successfully
- Vote on active proposals
- Attempt to vote twice (should fail)
- Attempt to vote after voting period ends (should fail)
- Verify vote tallies are accurate