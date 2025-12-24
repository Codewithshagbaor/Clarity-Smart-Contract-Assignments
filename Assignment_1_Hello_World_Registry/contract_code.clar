;; Hello World Registry Contract
;; Users can store and retrieve personalized greeting messages

;; Data Maps
;; TODO: Define a map to store messages with principal as key
;; Hint: (define-map map-name {key-type} {value-type})
(define-map messages principal (string-utf8 500))

;; Error Constants
(define-constant ERR-EMPTY-MESSAGE (err u100))
(define-constant ERR-MESSAGE-NOT-FOUND (err u101))

;; Public Functions

;; Set or update a greeting message for the caller
;; @param message: the greeting message to store
;; @returns (ok true) on success
(define-public (set-message (message (string-utf8 500)))
    (begin
        ;; TODO: Add validation to check message is not empty
        ;; TODO: Store the message in the map with tx-sender as key
        ;; Hint: Use (map-set messages tx-sender message)
        (ok true)
    )
)

;; Delete the caller's message
;; @returns (ok true) on success
(define-public (delete-message)
    (begin
        ;; TODO: Delete the message for tx-sender
        ;; Hint: Use (map-delete messages tx-sender)
        (ok true)
    )
)

;; Read-only Functions

;; Get message for a specific principal
;; @param user: the principal to look up
;; @returns (some message) if found, none otherwise
(define-read-only (get-message (user principal))
    ;; TODO: Retrieve and return the message for the given user
    ;; Hint: Use (map-get? messages user)
    none
)

;; Get the caller's own message
;; @returns (some message) if found, none otherwise
(define-read-only (get-my-message)
    ;; TODO: Call get-message with tx-sender
    none
)