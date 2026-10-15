---
layout: default
title: NoSQL databases
---

# NoSQL Databases

"NoSQL" is not a specific type of database. Instead it is an umbrella term, used to describe types of database that differ from the relational model we have learnt about. 

The following describes some of the most widely used types of NoSQL databases. 

## Key-value Stores

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

The keys (e.g. `user123`,`user124`) are unique. 

The values e.g. `"given_name": "Edgar"` can be structured in many different ways. In this example, they are structured like a dictionary. 

Key-value stores are designed to be queryed using the key. 

The advantage of key-value stores is they are extremely fast and they easily scale horizontally. We can distribute many records over several machines and it is fast to lookup records using the key. 

The disadvantage is that complex queries based on the contents of the value, joins and aggregations are generally not possible or limited. 

However, if we have a dataset that we always want to query in the same way e.g. customer records that we always query using a customer ID, key-value stores can be a good fit. 

An example of a key-value store is Redis. 

## Document Databases

A document database stores data as self-contained documents, typically represented using a JSON-like structure.

Here's an example:

```
 {
    "_id": 123,
    "given_name": "Edgar",
    "last_name": "Codd",
    "degree": "Computing",
    "score": 92
  }
```

This data has a key-value structure e.g. `given_name`, `last_name`, `degree` are keys and "Edgar", "Codd" and "Computing" are values. We can think of a document as being like a relational database row.  

However, a document can contain nested structures and arrays, making it more flexible than a typical relational row.

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

Unlike key-value stores we can query in more flexible ways, using the contents of a document. For example, to find all the Computing students:

```
db.students.find({
    degree: "Computing"
})
```

Unlike the relational model, documents in the same collection can have different fields e.g. the second document has a `course_rep` field. 

We call this a flexible schema or schema-less design. Developers often still aim for consistency between documents, but the database does not enforce it in the same way as a relational database.

Document databases are simpler than the relational model. For example, we don't have traditional constraints. Foreign keys and relationships between data are handled differently from relational databases. 

Data is often duplicated in different documents. This offers the advantage that all of the data needed by an application can be retrieved from a single document, but this can also result in inconsistencies.  

The advantage of document databases, like key-value stores, is that their simpler data model can make it easier to scale across multiple machines. We can distribute collections over several different machines. They can also be easier for programmers to work with as all the data for a particular object is neatly wrapped up in a single document, and there less need to do complex joins.  

A widely used document database is MongoDB. 


## Graph Databases

A graph database stores data as nodes and relationships.

We can think of a node as being similar to an entity in the relational model. Nodes can contain properties e.g.

```
{
  "student_id": 123,
  "given_name": "Edgar",
  "last_name": "Codd"
}
```

Relationships represent how those things are connected. Again, they can also contain properties e.g.

```
{
  "relationship": "studies",
  "start_year": 2025
}
```




Here's an example:

<pre class="mermaid">
flowchart LR

    Edgar(("123 (Edgar Codd)"))
    Elizabeth(("124 (Elizabeth Fong)"))
    Michael(("125 (Michael Stonebraker)"))

    Computing(("Computing"))
    DataScience(("Data Science"))

    Edgar -->|studies| Computing
    Elizabeth -->|studies| DataScience
    Michael -->|studies| Computing

    Edgar -->|friends_with| Michael
</pre>



Unlike relational databases, relationships are stored directly within the database rather than being reconstructed using foreign keys and joins.


A graph database might store the data like the following:

```
(123 Edgar Codd)-studies-(Computing)
(124 Elizabeth Fong)-studies-(Data Science)
(125 Michael Stonebraker)-studies-(Computing)
(123 Edgar Codd)-friends_with-(125 Michael Stonebraker)
```

We can ask questions such as:

- Who are Edgar Codd's friends?
- Which students study Computing?
- Which friends of Edgar study Computing?

In a graph database, these types of queries can often be performed more efficiently than in a relational database because the relationships are stored and can be answered without joining data.

This makes graph databases particuarly useful for applications involving complex relationships. For example, when recommending new people to follow or new content to view in a social media site. 


Like other NoSQL databases, graph databases can offer good scalability in some circumstances. However, their main advantage is their ability to model and query relationships.

The most well-known graph database is probably Neo4j.

