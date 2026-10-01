# The CAP Theorem

## What is CAP?

CAP describes a trade-off that applies to **distributed databases**, meaning databases that store copies of data on several servers (nodes). It says that when something goes wrong with the network, the database can't fully guarantee all three of the following at once.

## The three properties

### C: Consistency

Every read receives the **most recent write**, or an error. All nodes show the same data at the same time.

*Example:* You update your profile photo. Whichever server you or your friends are connected to, everyone sees the new photo.

**Careful:** this is not the same as the "C" in ACID. ACID consistency means *rules and constraints are kept*. CAP consistency means *all copies of the data agree*.

### A: Availability

Every request receives a **response** (not an error), even if some nodes are down. The response might not contain the very latest data.

*Example:* The shopping site stays up and keeps taking orders, even while part of the system has a problem.

### P: Partition tolerance

The system keeps working even when the **network between nodes fails**, so nodes can't talk to each other. This is called a network partition.

*Example:* A cable fault cuts off the London server from the New York server. Both are still running, but they can't share updates.

## Why you can't have all three

Imagine two servers holding copies of the same data, and the connection between them breaks. A user changes their data on Server 1. Then another user reads from Server 2, which hasn't received the change. The database must choose:

- **Refuse to answer** (or return an error) until the servers can sync again. This keeps the data **consistent** but sacrifices **availability**.
- **Answer with what it has**, which may be out of date. This keeps the system **available** but sacrifices **consistency**.

It can't do both, because it has no way of knowing the latest value while cut off.

## The real choice: CP or AP

Network failures will happen in any distributed system, so partition tolerance isn't really optional. The practical choice is what to give up **when a partition occurs**:

| Choice | Prioritises | During a partition | Suits | Examples |
|---|---|---|---|---|
| **CP** | Consistency | Some requests may be refused or fail | Banking, inventory, anything where wrong data is costly | MongoDB (default settings), HBase |
| **AP** | Availability | Stays up, but data may be briefly stale | Social feeds, shopping baskets, anything where being down is costly | Cassandra, DynamoDB, CouchDB |

## Connecting to ACID and BASE

- Many AP systems follow **BASE**: *Basically Available, Soft state, Eventually consistent*. Copies may disagree for a short time, but they converge once the network recovers.
- **Eventual consistency** is the key idea: if no new updates are made, all copies will eventually become identical.
- A single-server relational database doesn't face this trade-off, because there are no network partitions between copies of the data.

## Important caveats

- CAP is a **simplification**. Many databases are **tunable**, letting you choose stronger consistency or higher availability per query or configuration.
- The trade-off only bites **during a network failure**. When everything is working normally, good systems can offer both.
- Labels like "CP" and "AP" describe typical behaviour and leanings, not absolute categories.

## Key message for students

There's no perfect distributed database. When the network fails, you must choose between **correct but possibly unavailable** and **available but possibly out of date**. Which is right depends on what the application can tolerate.