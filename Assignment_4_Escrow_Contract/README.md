## Assignment 4: Simple Escrow Contract (Easy-Medium)

### Overview

Create a two-party escrow service where a buyer deposits STX, and funds are held until the buyer approves release to the seller. This protects both parties in a transaction—the seller knows payment is secured, and the buyer can refund if the service/product isn't delivered.

### Learning Objectives

- Implement state machine patterns (pending → completed/refunded)
- Handle multi-party authorization
- Work with STX transfers safely
- Prevent common escrow vulnerabilities

### Requirements

**Data Structures:**

- Map for escrow details (escrow-id → escrow data)
- Store: buyer, seller, amount, status (pending/completed/refunded), creation block
- Counter for total escrows created

**Escrow States:**

- **pending**: funds deposited, awaiting buyer approval
- **completed**: buyer released funds to seller
- **refunded**: buyer took refund, seller gets nothing

**Functions to Implement:**

1. **create-escrow** (public function)
    - Buyer creates an escrow and deposits STX
    - Parameters: seller principal, amount (uint)
    - Transfer STX from buyer to contract
    - Create new escrow with "pending" status
    - Automatically assign incremental escrow ID
    - Returns (ok escrow-id)
2. **release-funds** (public function)
    - Buyer approves and releases funds to seller
    - Parameter: escrow-id
    - Must verify: caller is buyer, escrow is pending
    - Transfer STX from contract to seller
    - Update status to "completed"
    - Returns (ok true)
3. **refund** (public function)
    - Buyer cancels and gets their money back
    - Parameter: escrow-id
    - Must verify: caller is buyer, escrow is pending
    - Transfer STX from contract back to buyer
    - Update status to "refunded"
    - Returns (ok true)
4. **get-escrow** (read-only function)
    - Retrieves all details about an escrow
    - Parameter: escrow-id
    - Returns escrow data including status and parties involved

**Security Considerations:**

- Only the buyer can release or refund
- Escrow can only be acted upon once (prevent double-spending)
- All STX transfers should be checked for success

**Bonus Challenge:**

- Charge a small service fee (e.g., 1%) to contract owner

**Test Cases:**

- Create escrow successfully
- Release funds to seller successfully
- Refund to buyer successfully
- Attempt to release funds twice (should fail)
- Non-buyer attempts to release/refund (should fail)
- Create multiple escrows between different parties