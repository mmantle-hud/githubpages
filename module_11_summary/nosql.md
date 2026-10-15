

# Limitations of Relational Databases

From the 1980s up to the 2000s relational databases dominated. 

If a person used the phrase 'database', they almost always meant a relational database. 

In the 2000s some people found relational databases had limitations and they looked for alternatives.

At this time, companies such as Google, Amazon and Facebook were dealing with volumes of data that hadn't been seen previously (social media posts, web traffic records, customer records etc.).

Some organisations found that traditional relational database architectures became increasingly difficult and expensive to scale to the enormous volumes of data being generated.

Previously, if there was a requirement to store more data in a relational database, we would invest in a computer with more storage and bigger memory. We describe this as scaling **vertically**. 

There are two problems with vertical scaling. The first is cost, machines with huge amounts of memory and storage are very expensive. The second is we can't keep scaling vertically forever.  There is a limit to how much data a single computer can store and handle. 

## Horizontal Scaling

Instead, companies started scaling **horizontally**. They spread the data across many different cheap computers.

The disadvantage of horizontal scaling is operations such as joins are difficult to make fast when data is spread across multiple machines. Furthermore, it is difficult to enforce ACID principles when data is distributed across multiple systems.

In some circumstances, companies accepted weaker consistency guarantees in exchange for improved scalability, availability and performance.

## NoSQL Databases

In the late 2000s the term **NoSQL** was used for new types of databases such as key-value stores and document databases that weren't built around the strict relational model. NoSQL databases could offer advantages such as easier horizontal scaling, and greater schema flexibility.

We will learn about some of these other types of database in the next set of reading.

## Relational Databases Remain Popular

Despite the rise in popularity of alternative databases, relational databases remain the most widely used type of database. 

Features such as strict data typing, constraints, referential integrity and ACID properties mean they are the first choice for many companies and organisations.

Furthermore, relational databases such as PostgreSQL have evolved, adding features that support larger datasets, and high-performance workloads.

Today, organisations often use multiple database technologies together, choosing relational or NoSQL databases depending on the requirements of each application.

