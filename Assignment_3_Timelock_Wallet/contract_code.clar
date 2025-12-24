;; Time-locked Wallet Contract
;; Deposit STX that can only be withdrawn after a specified block height

;; Data Maps
;; TODO: Define map to track each user's locked balance
(define-map balances principal uint)

;; TODO: Define map to track each user's unlock block height
(define-map unlock-heights principal uint)

;; Data Variable for total locked
(define-data-var total-locked uint u0)

;; Error Constants
(define-constant ERR-NOTHING-TO-WITHDRAW (err u300))
(define-constant ERR-STILL-LOCKED (err u301))
(define-constant ERR-TRANSFER-FAILED (err u302))
(define-constant ERR-NO-BALANCE (err u303))
(define-constant ERR-INVALID-AMOUNT (err u304))

;; Public Functions

;; Deposit STX with a lock period
;; @param amount: amount of STX to deposit (in micro-STX)
;; @param lock-blocks: number of blocks to lock for
;; @returns (ok true) on success
(define-public (deposit (amount uint) (lock-blocks uint))
    (let
        (
            ;; TODO: Calculate unlock height (current block + lock-blocks)
            (unlock-height (+ block-height lock-blocks))
        )
        ;; TODO: Validate amount > 0
        ;; TODO: Transfer STX from tx-sender to this contract
        ;; Hint: (stx-transfer? amount tx-sender (as-contract tx-sender))
        ;; TODO: Update user's balance and unlock-height
        ;; TODO: Update total-locked
        (ok true)
    )
)

;; Withdraw all locked STX (after unlock time)
;; @returns (ok amount) on success
(define-public (withdraw)
    (let
        (
            (user-balance (default-to u0 (map-get? balances tx-sender)))
            (user-unlock-height (default-to u0 (map-get? unlock-heights tx-sender)))
        )
        ;; TODO: Check that user has a balance
        ;; TODO: Check that current block-height >= unlock-height
        ;; TODO: Transfer STX from contract back to user
        ;; Hint: (as-contract (stx-transfer? user-balance tx-sender sender))
        ;; TODO: Clear user's balance and unlock-height
        ;; TODO: Update total-locked
        (ok user-balance)
    )
)

;; Extend the lock period
;; @param additional-blocks: blocks to add to lock period
;; @returns (ok new-unlock-height) on success
(define-public (extend-lock (additional-blocks uint))
    (let
        (
            (current-unlock (default-to u0 (map-get? unlock-heights tx-sender)))
        )
        ;; TODO: Check that user has a balance
        ;; TODO: Calculate new unlock height
        ;; TODO: Update unlock-heights map
        (ok current-unlock)
    )
)

;; Read-only Functions

;; Get locked balance for a user
;; @param user: the principal to check
;; @returns balance amount
(define-read-only (get-balance (user principal))
    ;; TODO: Return user's balance from map
    u0
)

;; Get unlock height for a user
;; @param user: the principal to check
;; @returns unlock block height
(define-read-only (get-unlock-height (user principal))
    ;; TODO: Return user's unlock height
    u0
)

;; Get total STX locked in contract
;; @returns total locked amount
(define-read-only (get-total-locked)
    (var-get total-locked)
)