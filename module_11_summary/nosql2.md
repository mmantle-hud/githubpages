# Types of NoSQL database

"NoSQL" is an umbrella term, not a single technology. The databases under it use very different data models, and most of them fall into four main families.

## 1. Key-value stores

**How data is stored:** A giant dictionary. Each item is a unique **key** pointing to a **value**, and the database doesn't look inside the value.

**Examples:** Redis, Amazon DynamoDB, Memcached

**Strengths:** Extremely fast and simple, and they scale easily because each lookup only needs the key.

**Weaknesses:** You can only find data by its key. Querying by the contents of a value, or joining data, is limited or impossible.

**Typical uses:** Caching, user sessions, shopping baskets, leaderboards.

*Example:* `session:8f3a2` → the logged-in user's session data.

## 2. Document databases

**How data is stored:** As self-contained **documents**, usually JSON-like, grouped into collections. Each document can have its own structure, and documents can contain nested data.

**Examples:** MongoDB, CouchDB, Firestore

**Strengths:** Flexible schema, and data that is used together is stored together, which matches how programmers work with objects. You can query by fields inside the document.

**Weaknesses:** Relationships between documents are harder to handle than with joins, and data is often duplicated (denormalised), which can lead to inconsistencies.

**Typical uses:** Product catalogues, user profiles, content management, apps where the data shape changes often.

*Example:* One order stored as a single document containing the customer details and a list of items.

## 3. Wide-column stores

**How data is stored:** In tables of rows and columns, but unlike relational tables, each row can have different columns, and data is organised for fast reads and writes across many servers.

**Examples:** Apache Cassandra, HBase, Google Bigtable

**Strengths:** Very high write throughput and designed to scale across many machines with no single point of failure.

**Weaknesses:** You usually have to design your tables around the exact queries you'll run. Ad-hoc queries and joins are poorly supported, and consistency is often relaxed ("eventual consistency").

**Typical uses:** Logs, sensor and IoT data, messaging systems, activity feeds, very large datasets.

*Example:* Storing billions of temperature readings, grouped by sensor and time.

## 4. Graph databases

**How data is stored:** As **nodes** (things) and **edges** (relationships between them). Relationships are stored directly, so following them is fast.

**Examples:** Neo4j, Amazon Neptune

**Strengths:** Excellent when the connections between data are the main point of the query, such as "friends of friends" or "shortest route." These queries are slow and awkward with many joins in SQL.

**Weaknesses:** A narrower use case, and harder to scale across many servers. They are less suited to simple, bulk data.

**Typical uses:** Social networks, recommendation engines, fraud detection, route planning.

*Example:* "Customers who bought this also bought..." by following purchase relationships.

## Other types worth a mention

- **Time-series databases** (InfluxDB, TimescaleDB) are optimised for data stamped with a time, such as metrics and sensor readings.
- **Search engines** (Elasticsearch) are built for fast full-text search.

These are sometimes counted as NoSQL, though they are more specialised.

## Summary table

| Type | Data model | Best for | Main trade-off |
|---|---|---|---|
| **Key-value** | Key → value | Caching, sessions | Lookup by key only |
| **Document** | JSON-like documents | Flexible, varied data | Relationships and duplication |
| **Wide-column** | Flexible rows, column families | Huge write volumes, scale | Query design is rigid |
| **Graph** | Nodes and edges | Highly connected data | Narrow use case, harder to scale |

## Key message for students

Each type is built for a particular kind of problem, and none is "better" overall. Many real systems combine several, such as a relational database for orders, Redis for caching, and Elasticsearch for search. This is called **polyglot persistence**.