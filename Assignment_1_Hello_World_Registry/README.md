# Assignment 1: Hello World Registry (Easy)

### Overview

Build a simple registry contract where users can store and retrieve personalized greeting messages. Each user (identified by their principal address) can set their own message and view messages from other users.

### Learning Objectives

- Understand how to store data using maps in Clarity
- Work with principal addresses to identify users
- Implement basic read and write functions
- Handle error cases appropriately

### Requirements

**Data Storage:**

- Use a map to store messages with the principal as the key
- Each message should be a string (string-utf8) with a reasonable max length (e.g., 500 characters)

**Functions to Implement:**

1. **set-message** (public function)
    - Allows a user to set or update their greeting message
    - Takes one parameter: the message text
    - Returns (ok true) on success
    - Should validate that the message is not empty
2. **get-message** (read-only function)
    - Retrieves the message for a given principal
    - Takes one parameter: the principal address to look up
    - Returns the message as (some message) if it exists, or none if not found
3. **get-my-message** (read-only function)
    - Retrieves the message for the caller (tx-sender)
    - No parameters needed
    - Returns the caller's message or none
4. **delete-message** (public function)
    - Allows users to delete their own message
    - No parameters needed
    - Returns (ok true) on success

**Test Cases:**

- User sets a message and retrieves it successfully
- User updates their existing message
- Attempting to get a message for a user who hasn't set one returns none
- User deletes their message