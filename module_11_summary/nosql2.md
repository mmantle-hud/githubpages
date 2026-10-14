# NoSQL databases

"NoSQL" is an umbrella term, not a single technology. 

The databases under it use very different data models.

The following describes some of the most widely used types. 

## Key-value stores

Data is stored in a simple way as keys and values.

Here's an example:


```
user123
{
  "given_name": "Edgar",
  "last_name": "Codd",
  "degree": "Computing",
  "score": 92
}
user124
{
  "given_name": "Elizabeth",
  "last_name": "Fong",
  "degree": "Data Science",
  "score": 67
}

```

The keys (e.g. `user123`,`user124`) are unique. The values can be strictured in many different ways. 

Key-value stores are designed to be queryed using the key. Complex queries based on the contents of the value, joins and aggregations are generally not possible or limited.

The advantage of key-value stores is they are extremely fast and they easily scale horizontally. We can distribute many records over several machines and it is fast to lookups records using the key. 

If we have a dataset that we always want to query in the same way, key-value stores can be a good fit. 

An example key-value store is Redis. 



## Document databases

A document database stores data as a document e.g.

```
 {
    "_id": 123,
    "given_name": "Edgar",
    "last_name": "Codd",
    "degree": "Computing",
    "score": 92
  }
```
This data has a key-value structure e.g. given_name, last_name, degree are keys and "Edgar", "Codd" and "Computing" are values. We can think of a document as being like a relational database row.  

We can then gather a number of documents together into a collection. 

```
[
  {
    "_id": 123,
    "given_name": "Edgar",
    "last_name": "Codd",
    "degree": "Computing",
    "score": 92
  },
  {
    "_id": 124,
    "given_name": "Elizabeth",
    "last_name": "Fong",
    "degree": "Data Science",
    "score": 67,
    "course_rep": true
  },
  {
    "_id": 125,
    "given_name": "Michael",
    "last_name": "Stonebraker",
    "degree": "Computing",
    "score": 84
  }
]
```

We can think of a collection as being like a relational database table. 

Unlike key-value stores we can query in more flexible ways e.g. find all the Computing students. 

```
db.students.find({
    degree: "Computing"
})
```

Unlike the relational model, documents in the same collection can have different fields e.g. the second document has a "course_rep" field. We call this a flexible schema or schema-less design. 

Again, document databases are simpler than the relational model. For example, we don't have traditional foreign keys, and relationships between data are often handled differently from relational databases. Data is often duplicated in different documents, so that all of the data needed by an application can be retrieved from a single document. This can result in inconsistencies.  



However, like key-value stores, the simplicity of document databases mean they scale effectively. They can also be easier for programmers to work with as all the data for a particular object is neatly wrapped up in a single document. There isn't any need to do complex joins.  

The most famous document database is probably MongoDB. 


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