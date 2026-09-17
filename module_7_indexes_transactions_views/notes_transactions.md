# Transactions

Modern relational databases support **concurrency**. Many different users can perform actions on the database at the same time.

This is a necessity for live, real world databases e.g. an ecommerce website where thousands of users simultaneously browse and purchase products from the site. If databases didn't support concurrency only one user could use the site at a time. 

Multi-user databases can create problems for database servers and for the developers who build database-driven applications. 


Consider a website that is selling tickets for a very popular event. Users access the website, select a number of tickets, select seats from a map of the venue, and then proceed to the checkout to purchase the tickets. 

How do we handle the situation where two users are simultaneously trying to purchase the tickets for the same seat? How do we make sure we don't sell the same seat to two different users? 

To prevent situations like double selling the same seat, databases use locks and transactions. 

## Locks
A lock is used to prevent access to a specific table or more row in a table. 

Locks depend on the action users want to perform. 

**Shared locks**. When reading data using `SELECT` statements, many users can read the same data at the same time. Although, we call this a **shared lock**, there isn't really a lock, everyone can access the data. 

**Exclusive locks**. This applies to editing data. Only one person can `UPDATE` or `DELETE` a row at a time. While they are editing, everyone else must wait. Once the first person has completed their action, the second person can execute their's.

**Readers and writers do not block each other**. If User A is editing a row, User B can still read the old version of that row.


Let's go back to the ticket selling application and see what problems this can create

- Table State: Seat 23E is currently `status = 'AVAILABLE'`.
- User A and User B are searching the website for seats.
- User A clicks on Seat 23E: `SELECT * FROM seats WHERE seat_id = '23E';` (Sees 'AVAILABLE').
- User B clicks on Seat 23E: `SELECT * FROM seats WHERE seat_id = '23E';` (Sees 'AVAILABLE').
- User A adds Seat 23E to their cart: `UPDATE seats SET status = 'RESERVED', user = 'A' WHERE seat_id = '23E';`.
- User B adds Seat 23E to their cart: `UPDATE seats SET status = 'RESERVED', user = 'B' WHERE seat_id = '23E';`.
- The ticket is sold twice!

By default, the read actions (selecting the seat) do not block each other. 

And although only one user can purchase the ticket at a time, the `UPDATE` actions will be queued and the ticket will be sold twice.

## Transactions

A **transaction** is a group of SQL statements treated as a single block. Either all the statements succeed and save together, or none of them do, leaving the database completely unchanged.

The classic example used to illustrate transactions is transferring money between bank accounts. For example, User A wants to transfer £100 from their bank account to the bank account of User B. 

There are two statements that need to be executed

#### Statement 1
```sql
-- Subtract £100 from User A's bank account.
UPDATE bank_accounts SET balance = balance - 100
WHERE account_holder = 'User A';
```

#### Statement 2
```sql
-- Deposit £100 in User B's bank account. 
UPDATE bank_accounts SET balance = balance + 100
WHERE account_holder = 'User B';
```

What if there is a problem (e.g. a power cut, or network failure) immediately after the first statement has run, but before the second statement has had a chance to execute. 

User A will have £100 deducted from their account that User B never receives. 

To prevent this we need to use a transaction. We need to treat the two statements as a single block. 

```sql
-- Start the transaction block
BEGIN;
-- Run Statement 1
UPDATE bank_accounts SET balance = balance - 100 WHERE account_holder = 'User A';
-- Run Statement 2
UPDATE bank_accounts SET balance = balance + 100 WHERE account_holder = 'User B';
-- Save the changes permanently
COMMIT;

```

`BEGIN` and `COMMIT` are keywords that mark out the start and end of a transaction. Now, if we run this SQL and there is a problem immediately after running Statement 1, neither statement will be executed. The database temporarily executes the first statement, but these changes aren't saved (committed) until the second statement has also run. 

We call this **atomicity**. Atomicity means that all SQL statements in a transaction are treated as an all-or-nothing package. Even if one statement fails, the entire transaction is rolled back and none of the changes are saved.

Can transactions help our ticket booking problem? We could do something like:

#### Transaction for User A
```sql
BEGIN;
-- User A selects seat 23E
SELECT * FROM seats WHERE seat_ id = '23E';
-- User A reserves seat 23E
UPDATE seats SET STATUS = 'RESERVED', user = 'A' WHERE seat_id = '23E';
COMMIT;
```

#### Transaction for User B
```sql
BEGIN;
-- User B selects seat 23E
SELECT * FROM seats WHERE seat_id = '23E';
-- User B reserves seat 23E
UPDATE seats SET STATUS = 'RESERVED', user = 'B' WHERE seat_id = '23E';
COMMIT; 
```
This doesn't really help us.  If User A and User B both start their transactions at the same time, they will both read the seat as AVAILABLE.

To fix the problem we need to tell PostgreSQL to lock the row as soon as we read it. To do this we use `FOR UPDATE`.

#### Transaction for User A
```sql
BEGIN;
-- User A selects seat 23E, the seat is immediately locked
SELECT * FROM seats WHERE seat_id = '23E' FOR UPDATE;
-- Step 2: Book the seat safely
UPDATE seats SET status = 'RESERVED', user = 'A' WHERE seat_id = '23E';
COMMIT;
```
Now, when User B selects seat 23E, their screen will freeze until User A's transaction has finished. The User B `SELECT` statement will only execute once the status of the seat has been updated. At this point, the `SELECT` statement will return the details of Seat 23E, showing the seat has been reserved. . 



User A locks the seat with FOR UPDATE.User B tries to lock the same seat, but PostgreSQL forces them to wait.User A finishes their purchase and hits COMMIT. The lock is released.User B's screen unfreezes and their query finally runs. However, they now see the status is RESERVED, safely preventing the double-booking!



|User A                                                                  |UserB                                                           |
|------------------------------------------------------------------------|----------------------------------------------------------------|
|Sees seat 23E is 'AVAILABLE'.                                           |                                                                |
|                                                                        |Sees seat 23E is 'AVAILABLE'                                    | 
|Clicks on Seat 23E: `SELECT * FROM seats WHERE seat_id = '23E';`        |                                                                |
|                                                                        |Clicks on Seat 23E: `SELECT * FROM seats WHERE seat_id = '23E';`|
|User A adds Seat 23E to their cart: `UPDATE seats SET status = 'RESERVED', user = 'A' WHERE seat_id = '23E';`|                           |
|                                                                        |User B adds Seat 23E to their cart: `UPDATE seats SET status = 'RESERVED', user = 'B' WHERE seat_id = '23E';`.                                                                        ||


## Basic Example

[Step 1: Deduct £50 from Alice] ---> SUCCESS! (Alice now has £50)

               |
         🔥🔥 CRASH! 🔥🔥 (Power cut, server unplugged, or network failure)
               |

[Step 2: Add £50 to Bob] ---> NEVER HAPPENS!

```
-- 1. Create a simple accounts table
CREATE TABLE bank_accounts (
    account_holder VARCHAR(50),
    balance INT CHECK (balance >= 0) -- Check constraint to prevent overdrawing!
);

-- 2. Set up our initial balances
INSERT INTO bank_accounts VALUES ('Alice', 100), ('Bob', 50);
```

all goes smoothly

```
-- Start the transaction block
BEGIN;

-- Run Step 1
UPDATE bank_accounts SET balance = balance - 50 WHERE account_holder = 'Alice';

-- Run Step 2
UPDATE bank_accounts SET balance = balance + 50 WHERE account_holder = 'Bob';

-- Save the changes permanently
COMMIT;

-- Query the table: Alice has 50, Bob has 100. Perfect.
SELECT * FROM bank_accounts;

```

simulate an issue that uses rollback

```
-- Reset balances for the test
UPDATE bank_accounts SET balance = 100 WHERE account_holder = 'Alice';
UPDATE bank_accounts SET balance = 50 WHERE account_holder = 'Bob';

-- Start a new transaction
BEGIN;

-- Step 1 runs fine
UPDATE bank_accounts SET balance = balance - 50 WHERE account_holder = 'Alice';

-- 💥 SIMULATE ERROR: The teacher cancels the process mid-way, or a query fails
-- Because we used BEGIN, we can safely hit the emergency abort button:
ROLLBACK;

-- Query the table now: Alice still has 100, Bob still has 50!
-- The partial deduction from Alice was completely erased.
SELECT * FROM bank_accounts;

```

You can summarize this lesson for their notes using the concept of Atomicity (the 'A' in ACID):💡 The All-or-Nothing Rule: A transaction treats a group of SQL statements as a single unit of work. Either all of the statements succeed and get saved together (COMMIT), or none of them do, and the database resets itself to the start (ROLLBACK). There is no middle ground.

## Race conditions

How to Simulate This Live in Class (No Code Required)

- You don't even need a python script to show this to your class.
- If you are projecting your screen, you can open two separate database terminal windows side-by-side to represent Sarah and Tom.
- In Window 1 (Sarah), type BEGIN; and run the SELECT ... FOR UPDATE; query.
- Do not type commit yet.
- In Window 2 (Tom), type BEGIN; and try to run the exact same SELECT query.
- Watch the magic happen: Window 2 will completely freeze.
- It will sit there loading indefinitely.
- Explain to the students that the database has physically put Tom in a microscopic queue.
- Go back to Window 1 (Sarah) and type COMMIT;.
- The instant you hit enter, Window 2 (Tom) will suddenly unfreeze, run its query, see that the status is now 'SOLD', and trigger its application-level ROLLBACK.
- This live demonstration is incredibly powerful for students because they get to see the database physically pausing time to protect the integrity of the data.
- Would you like me to write out the exact plain SQL commands you can copy-paste into your two terminal windows to run this live "Terminal 1 vs Terminal 2" showcase?

all-or-nothing consistency (money) and concurrency protection (tickets).
