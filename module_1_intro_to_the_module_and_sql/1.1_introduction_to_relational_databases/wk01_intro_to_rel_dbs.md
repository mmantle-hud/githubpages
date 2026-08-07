# Introduction to Relational Databases and SQL
Post-Gres-Q-L
## Relational Databases

movies or students example. 

Relational Databases work by storing data in tables. A table represents a type of thing (an entity), each row represents one instance or a specifc example of that thing and the columns specify the meaning of individual pieces of data associated with that instance. So for this table I'm storing data about students. Each row represents a specific student. Each individual cell in this row is a field and stores a single value.

It's important to be clear about the terminology

Developer Term (Physical)	Mathematical Term (Logical)
Table	                    Relation (A set of related data)
Column 	                    Attribute (A characteristic of the data)
Row / Record	            Tuple (An ordered list of values)

In Codd's original paper he used the terms relation, attribute and tuple. For most poeple table, column and row are more inutitive and easier work with and I generally use these terms, althouhg I will occassionally use the term attribute. 

Show hierarchy

A database is a collection of tables e.g. an e-commerce web application would have it's own database. Within the database we would have several different tables e.g. for products, users, orders etc. 

A RDMS e.g. PostgresSQL

Manage multiple databases: One PostgreSQL installation can host a "Finance" database, a "Marketing" database, and a "Customer Portal" database all at once.
Handle Security: It decides which users can log into which database.
Ensure Uptime: It handles backups, crash recovery, and logging. 

## SQL
SQL is the language we use to 'talk' to the database. 

Show example e.g. SELECT firstname, lastname, course FROM students WHERE mark >= 40;

SQL is declarative: You tell the database what you want, not how to get it.
It's quite 'english like'. The database deals with the complexities of how exactly you get the data out. We just tell it what we want. For example, even if you've never seen SQL before you can probably make sense of this query is doing. 

SQL is a standard
 - All the major relational databases (PostgreSQL, MySQL, Oracle, etc.) uses SQL. 
 - There are different SQL dialects (small differences between different dbmss) but generally it is a universal language. Once you learn the basics, you can talk to almost any major database in the world.

How do we talk to the database. We can do this by issuing commands in a terminal, we can use some kind of a GUI e.g. DBeaver, or we can issue these commands from code. For example, here is the same query integrated into some python code.




