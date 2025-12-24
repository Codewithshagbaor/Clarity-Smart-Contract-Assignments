## Assignment 5: NFT Marketplace (Hard)

### Overview

Build a decentralized marketplace where users can list their NFTs for sale, other users can purchase them, and sellers can cancel or update their listings. The marketplace handles NFT custody, payment processing, and optional marketplace fees. This is a real-world DeFi application that requires careful handling of multiple state changes and edge cases.

### Learning Objectives

- Interact with NFT contracts (SIP-009 standard)
- Handle complex multi-step transactions
- Implement marketplace fee mechanics
- Manage NFT custody and escrow
- Handle edge cases and race conditions
- Work with trait references for NFT contracts

### Requirements

**Data Structures:**

- Map for active listings (listing-id → listing data)
- Store: seller, nft-contract, nft-id, price, status (active/sold/cancelled)
- Counter for total listings created
- Marketplace fee percentage (e.g., 2.5%)
- Marketplace owner address

**Functions to Implement:**

1. **list-nft** (public function)
    - Lists an NFT for sale on the marketplace
    - Parameters: nft-contract (trait reference), nft-id (uint), price (uint in STX)
    - Transfer NFT from seller to marketplace contract (escrow)
    - Create listing with "active" status
    - Returns (ok listing-id)
    - Must verify: caller owns the NFT
2. **buy-nft** (public function)
    - Purchase a listed NFT
    - Parameter: listing-id
    - Must verify: listing is active, buyer sent correct amount
    - Calculate marketplace fee and seller proceeds
    - Transfer STX from buyer: fee to marketplace owner, rest to seller
    - Transfer NFT from contract to buyer
    - Update listing status to "sold"
    - Returns (ok true)
3. **cancel-listing** (public function)
    - Seller cancels their listing and reclaims their NFT
    - Parameter: listing-id
    - Must verify: caller is the seller, listing is active
    - Transfer NFT back to seller
    - Update listing status to "cancelled"
    - Returns (ok true)
4. **update-price** (public function)
    - Seller changes the price of their active listing
    - Parameters: listing-id, new-price (uint)
    - Must verify: caller is seller, listing is active
    - Update price in listing data
    - Returns (ok true)
5. **get-listing** (read-only function)
    - Retrieves details about a listing
    - Parameter: listing-id
    - Returns all listing information
6. **set-marketplace-fee** (public function)
    - Owner can update the marketplace fee percentage
    - Parameter: new-fee (uint, e.g., 250 for 2.5%)
    - Must verify: caller is marketplace owner
    - Returns (ok true)

**Advanced Considerations:**

- Handle different NFT contracts (use trait references)
- Prevent reentrancy issues
- Handle case where NFT transfer fails
- Ensure atomic transactions (all-or-nothing)

**Test Cases:**

- List an NFT successfully
- Buy a listed NFT and verify all parties receive correct amounts
- Cancel a listing and verify NFT returns to seller
- Update listing price
- Attempt to buy cancelled listing (should fail)
- Non-seller attempts to cancel listing (should fail)
- Calculate fees correctly for various price points
- Handle listings from multiple sellers simultaneously

**Security Checklist:**

- [ ]  Verify NFT ownership before listing
- [ ]  Prevent double-spending of NFTs
- [ ]  Ensure atomic swaps (payment + NFT transfer together)
- [ ]  Validate all state transitions
- [ ]  Check for integer overflow in fee calculations
- [ ]  Only seller can modify their listings