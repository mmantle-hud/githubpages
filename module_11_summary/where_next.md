# Where Next

We have covered key relational databases subjects in the course. Here are some additional topics that we haven't had time to cover or are more advanced relational database topics.

## Database Security

In the lab sessions we have always used a database that has been set-up for us. We haven't had to consider different users and different levels of access. 

Database security is concerned with ensuring only authorised users can access the right data and perform the right actions. 

Database security helps protect data from unauthorised access, modification or accidental loss.

We can create users and assign them passwords using SQL

```sql
CREATE USER learner
WITH PASSWORD 'secret';
```

Users have to log in before running queries. We call this **authentication**. When we did the lab work, a set-up script logged you into a PostgreSQL database automatically. 

Different types of user have different levels of access. We call this **authorisation**. For example:

```sql
GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO learner;
```

```sql
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO lecturer;
```

The `learner` user can only run `SELECT` queries on thedatabase, whereas the `lecturer` user can perform full CRUD operations. 


## Full Text Search
We have considered pattern matching using the `LIKE` operator. However, this has some limitations. 
- Doesn't understand related words
- Slow on large amounts of text
- Returns all matches equally

PostgreSQL supports far more sophisticated text searching using something called `tsvector`. `tsvector` converts text into a searchable representation.

This speeds up searching, and importantly PostgreSQL can rank results based on how closely text matches the search term.

```sql
SELECT
    course_name,
    ts_rank(
        to_tsvector(description),
        to_tsquery('database')
    ) AS score
FROM courses
ORDER BY score DESC;
```


| course_name | score |
|--------|-------|
|Relational Databases and Web Integration| 0.95|
|Data Analysis in Practice |0.81  |
|Programming for Data Science| 0.76 |

## More Topics to Explore
- Set Operation such as `UNION` and `INTERSECT` for combining the results of multiple queries.
- Conditional logic in SQL e.g. `CASE` for returning different values depending on conditions.
- Query Optimisation to improve database performance and reduce execution time.
- Stored Procedures and Functions for encapsulating reusable database logic.
