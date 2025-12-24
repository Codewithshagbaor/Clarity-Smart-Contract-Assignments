## Assignment 3: Time-locked Wallet (Easy-Medium)

### Overview

Build a wallet contract that holds STX tokens and only releases them after a specified block height. Users can deposit STX with a lock period, and once that period expires, they can withdraw their funds. This simulates vesting schedules or savings accounts.

### Learning Objectives

- Work with STX token transfers
- Understand block-height for time-based conditions
- Implement deposit and withdrawal patterns
- Handle edge cases in financial contracts

### Requirements

**Data Storage:**

- Map tracking each user's locked balance
- Map tracking each user's unlock block height
- Track total STX held in contract

**Functions to Implement:**

1. **deposit** (public function)
    - Allows users to deposit STX into the time-locked wallet
    - Parameters: amount (uint), lock-blocks (uint - how many blocks to lock for)
    - Transfer STX from user to contract
    - Set unlock-height as current block-height + lock-blocks
    - If user already has a deposit, you can either reject or add to existing (specify in docs)
    - Returns (ok true) on success
2. **withdraw** (public function)
    - Allows users to withdraw their STX after unlock time
    - No parameters (withdraws caller's full balance)
    - Must check: unlock block height has been reached
    - Transfer STX from contract back to user
    - Clear user's balance and unlock-height
    - Returns (ok amount-withdrawn)
    - Error if trying to withdraw before unlock time
3. **get-balance** (read-only function)
    - Returns the locked balance for a given principal
    - Parameter: user principal
4. **get-unlock-height** (read-only function)
    - Returns the block height when funds become available
    - Parameter: user principal
5. **extend-lock** (public function)
    - Allows users to extend their lock period
    - Parameter: additional-blocks (uint)
    - Can only extend, not shorten the lock period
    - Returns (ok new-unlock-height)

**Bonus Challenge:**

- Add an emergency withdrawal function with a penalty fee (e.g., lose 10% for early withdrawal)
- Allow partial withdrawals instead of all-or-nothing

**Test Cases:**

- Deposit STX successfully
- Attempt withdrawal before unlock time (should fail)
- Withdraw successfully after unlock time
- Extend lock period successfully
- Multiple users with different lock times