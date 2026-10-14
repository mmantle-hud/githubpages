

# 

From the 1980s up to the 2000s relational databases dominated. 

If a person used the phrase 'database', they almost always meant a relational database. 

In the 2000s some people found relational databases had limitations and they looked for alternatives.

## Limitations of Relational Databases

In the 2000s companies such as Google, Amazon and Facebook were dealing with volumes of data that hadn't been seen previously (social media posts, web traffic records, customer records etc.).

At the time, relational databases struggled to deal with the vast amounts of data. 

Previously, if there was a requirement to store more data in a relational database, we would invest in a computer with more storage and bigger memory. We describe this as scaling **vertically**. 

There are two problems with vertical scaling. The first is cost, machines with huge amounts of memory and storage are very expensive. The second is we can't keep scaling vertically forever.  There is a limit to how much data a single computer can store and handle. 

## Horizontal Scaling

Instead, companies started scaling **horizontally**. They spread the data across many different cheap computers.

The problem with horizontal scaling is operations such as joins are difficult to make fast when data is spread across multiple machines. Furthermore, it is difficult to enforce ACID transactions. 

Companies such as Amazon and Google were happy to relax ACID guarentees for speed





# Why people looked beyond relational databases in the 2000s

For about thirty years, relational databases were the default answer to almost every data storage problem. In the 2000s, a new set of pressures led developers to look for alternatives. The relational model didn't stop working, but some companies were facing problems it had not been designed for.

## 1. Web-scale data and traffic

Companies like Google, Amazon and Facebook were handling data and user numbers far beyond what a single server could manage. Relational databases traditionally scale **vertically**, by buying a bigger, more expensive machine, and that has a ceiling. These companies wanted to scale **horizontally**, by spreading data across many cheap commodity servers. Joins and ACID transactions are hard to keep fast and correct when the data is split across machines.

## 2. Availability mattered more than strict consistency

For a shopping basket or a social media feed, being briefly out of date is acceptable, but being unavailable is not. Amazon's Dynamo paper (2007) and Google's Bigtable paper (2006) described systems that deliberately relaxed some ACID guarantees in exchange for speed and uptime. Their designs inspired many open-source databases.

## 3. Rigid schemas didn't suit fast-changing or varied data

Relational databases require you to define the structure up front, and changing it on a huge live table can be slow and disruptive. Web applications were evolving rapidly, and many were storing data like user profiles, JSON from APIs, logs and sensor readings, where every record might look slightly different.

## 4. A mismatch with how programmers think

Application code tends to work with nested objects, while relational databases store flat tables. Converting between the two (the "object-relational impedance mismatch") was awkward and added complexity. Storing an object as a single document felt more natural.

## 5. Cost and openness

Commercial relational databases were expensive to license at scale. Free, open-source alternatives that ran on cheap hardware were attractive, especially to start-ups.

## The result

Around 2009 the term **NoSQL** became popular as a label for this wave of databases. A more accurate way to describe it is that developers stopped assuming one database fits everything. Each new type made a **trade-off**: they gave up some relational features, often some ACID guarantees, in return for scale, flexibility or speed.

It is also worth noting that relational databases have not gone away. They remain the core of most systems, and have since adapted by adding features such as JSON support and better scaling options.