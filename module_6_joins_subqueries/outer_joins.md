# Outer Joins

An outer join combines two tables by returning all matching rows plus the unmatched rows from one or both tables.

To illustrate the idea of an outer join and why they can be useful we will look at the travel guide database we looked at previously. This database stores data about cities and the countries they are located in. There is a one-to-many relationship between the countries and cities tables.  

**countries**
| country_id (PK)| country_name | total_population | currency_code |
| :--- | :--- | :--- | :--- |
| 1 | Germany | 84000000 | EUR |
| 2 | Spain | 48000000 | EUR |
| 3 | Japan | 125000000 | JPY |
| 4 | Canada | 40000000 | CAD |
| 5 | Morocco | 37000000 | MAD |


**cities**
| city_id (PK)| city_name | is_capital | avg_temp_celsius | country_id (FK) |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Berlin | true | 10.5 | 1 |
| 2 | Munich | false | 9.0 | 1 |
| 3 | Hamburg | false | 9.7 | 1 |
| 4 | Madrid | true | 15.0 | 2 |
| 5 | Barcelona | false | 18.2 | 2 |
| 6 | Tokyo | true | 16.5 | 3 |

We looked at an `INNER JOIN` query that combined rows from both tables

```sql
SELECT
    *
FROM
    countries
    INNER JOIN cities ON countries.country_id = cities.country_id;
```

**results**
| country_id | country_name | total_population | currency_code | city_id | city_name | is_capital | avg_temp_celsius | country_id (1) | 
|------------|--------------|------------------|---------------|---------|-----------|------------|------------------|----------------| 
| 1          | Germany      | 84000000         | EUR           | 1       | Berlin    | 1          | 10.5             | 1              | 
| 1          | Germany      | 84000000         | EUR           | 2       | Munich    |            | 9                | 1              | 
| 1          | Germany      | 84000000         | EUR           | 3       | Hamburg   |            | 9.7              | 1              | 
| 2          | Spain        | 48000000         | EUR           | 4       | Madrid    | 1          | 15               | 2              | 
| 2          | Spain        | 48000000         | EUR           | 5       | Barcelona |            | 18.2             | 2              | 
| 3          | Japan        | 125000000        | JPY           | 6       | Tokyo     | 1          | 16.5             | 3              | 


An `INNER JOIN` only retrieves rows where there is a match between _countries.country_id_ and _cities.country_id_. The _countries_ table contains two countries (Canada and Morocco) that don't have any linked cities in the _cities_ table. Therefore, these countries don't appear in the result set. 

If we change the join type to an outer join, specifically a `LEFT JOIN`.


```sql
SELECT
    *
FROM
    countries
    LEFT JOIN cities ON countries.country_id = cities.country_id;
```

| country_id | country_name | total_population | currency_code | city_id | city_name | is_capital | avg_temp_celsius | country_id (1) | 
|------------|--------------|------------------|---------------|---------|-----------|------------|------------------|----------------| 
| 1          | Germany      | 84000000         | EUR           | 1       | Berlin    | 1          | 10.5             | 1              | 
| 1          | Germany      | 84000000         | EUR           | 2       | Munich    |            | 9                | 1              | 
| 1          | Germany      | 84000000         | EUR           | 3       | Hamburg   |            | 9.7              | 1              | 
| 2          | Spain        | 48000000         | EUR           | 4       | Madrid    | 1          | 15               | 2              | 
| 2          | Spain        | 48000000         | EUR           | 5       | Barcelona |            | 18.2             | 2              | 
| 3          | Japan        | 125000000        | JPY           | 6       | Tokyo     | 1          | 16.5             | 3              | 
| 5          | Morocco      | 37000000         | MAD           | NULL    | NULL      | NULL       | NULL             | NULL           | 
| 4          | Canada       | 40000000         | CAD           | NULL    | NULL      | NULL       | NULL             | NULL           | 

An outer join retrieves **all** the rows from one table and rows from the second table only if matching rows are found.

This is a `LEFT JOIN`, so we retrieve all the rows from the left side of the join (_countries_). We only retrieve rows from the right side of the join if there is a match on _country_id_. 

We now get Canada and Morocco in our results. There aren't any cities for these countries, so the city columns have NULL values. 

Let's look at a more useful query. This `INNER JOIN` query finds the number of cities for each country in the database. 

```sql
SELECT
    countries.country_name,
    COUNT(cities.city_name) AS num_of_cities
FROM
    countries
    INNER JOIN cities ON countries.country_id = cities.country_id
GROUP BY
    countries.country_name;
```

| country_name | num_of_cities |
| :--- | :--- |
| Spain | 2 |
| Germany | 3 |
| Japan | 1 |

Again, Canada and Morocco are missing. It would be good if we could include them in our result set. We can do this using a `LEFT JOIN`.

```sql
SELECT
    countries.country_name,
    COUNT(cities.city_name) AS num_of_cities
FROM
    countries
    LEFT JOIN cities ON countries.country_id = cities.country_id
GROUP BY
    countries.country_name;
```

| country_name | num_of_cities | 
|--------------|---------------| 
| Spain        | 2             | 
| Germany      | 3             | 
| Canada       | 0             | 
| Japan        | 1             | 
| Morocco      | 0             | 

Now we keep all the rows from the left table and the result set includes Canada and Morocco. 

## Right Join
A right join works in exactly the same way, but we include all the rows from the right side table. 

Previously we looked at a many-to-many relationship between movie and genre. We implemented this using a junction table (_movie_genre_)


**movies**
| movie_id | title                          | release_year | duration_in_minutes | primary_language | 
|----------|--------------------------------|--------------|---------------------|------------------| 
| 1        | Casablanca                     | 1943         | 102                 | en               | 
| 2        | Moonlight                      | 2016         | 111                 | en               | 
| 3        | Winter's Bone                  | 2010         | 100                 | en               | 
| 4        | Spirited Away                  | 2001         | 125                 | ja               | 
| 5        | RRR                            | 2022         | 187                 | te               | 
| 6        | Crouching Tiger, Hidden Dragon | 2000         | 120                 | zh               |

**genres**
| genre_id | genre_name | genre_description                                                | 
|----------|------------|------------------------------------------------------------------| 
| 1        | Animation  | Films created using drawing, CGI, or stop-motion techniques.     | 
| 2        | Fantasy    | Elements of magic, mythology, folklore, or supernatural worlds.  | 
| 3        | Adventure  | Exciting stories focusing on journeys, exploration, or quests.   | 
| 4        | Action     | High-energy films featuring stunts, battles and chase sequences. | 
| 5        | Drama      | Character-driven stories dealing with realistic themes.          | 
| 6        | Romance    | Stories focusing on romantic relationships and love.             | 
| 7        | Mystery    | Plots revolving around solving a crime, puzzle, or secret.       | 
| 8        | Sience Fiction |Stories based in a future world that focus on advances in technology and science.       | 

**genre_movie**
| genre_id | movie_id | 
|----------|----------| 
| 1        | 1        | 
| 2        | 1        | 
| 1        | 2        | 
| 1        | 3        | 
| 3        | 3        | 
| 4        | 4        | 
| 5        | 4        | 
| 6        | 4        | 
| 7        | 5        | 
| 1        | 5        | 
| 7        | 6        | 
| 6        | 6        | 
| 5        | 6        | 

We might want to find unpopular genres in our movies database. Specifically, all genres that currently have zero movies assigned to them.

If we use a `RIGHT JOIN` to join the junction table _genre_movie_ to _genres_ we retrieve all the rows from the right side of the join. We can see the 'Science Fiction' genre has been included even though no movies have been categorised using this genre. 

```sql
SELECT
    g.genre_name,
    gm.movie_id
FROM
    genre_movie gm
    RIGHT JOIN genres g ON gm.genre_id = g.genre_id;
```
**result**
| genre_name      | movie_id | 
|-----------------|----------| 
| Drama           | 1        | 
| Romance         | 1        | 
| Drama           | 2        | 
| Drama           | 3        |  
| ...             | ...      | 
| Adventure       | 30       | 
| Drama           | 31       | 
| Drama           | 32       | 
| Drama           | 33       | 
| Romance         | 33       | 
| Science Fiction | NULL     | 

We can filter the results to only retrieve the genres that don't have a match in the junction table.

```sql
SELECT
    g.genre_name,
    gm.movie_id
FROM
    genre_movie gm
    RIGHT JOIN genres g ON gm.genre_id = g.genre_id
WHERE gm.movie_id IS NULL;
```

**result**
| genre_name      | movie_id | 
|-----------------|----------|  
| Science Fiction | NULL     | 

## Are `LEFT JOIN' and `RIGHT JOIN` the same?

Any `LEFT JOIN` can be re-written as a `RIGHT JOIN` simply by changing the order of the table in the join e.g.

```sql
SELECT
    g.genre_name,
    gm.movie_id
FROM
    genres g
    LEFT JOIN genre_movie gm ON g.genre_id = gm.genre_id
WHERE gm.movie_id IS NULL;
```
**result**
| genre_name      | movie_id | 
|-----------------|----------|  
| Science Fiction | NULL     | 

## Another Example
Need to move the student example into database design. 

A common requirement for tutors would be to find all the students that haven't submitted assessments. We can do this using a `LEFT JOIN`. 

```sql
SELECT
    s.given_name,
    s.family_name
FROM
    students AS s
LEFT JOIN 
    student_assessment_scores AS sas 
    ON s.student_id = sas.student_id 
WHERE 
    sas.student_id IS NULL;
```

| given_name | family_name | 
|------------|-------------| 
| Michael    | Stonebraker | 

This works fine, but it only finds students that failed to submit all assessments.

We can find the students that failed to submit for a specific assessment by using `AND` in the join. 

```sql
SELECT
    s.given_name,
    s.family_name
FROM
    students AS s
LEFT JOIN 
    student_assessment_scores AS sas 
    ON s.student_id = sas.student_id 
    AND sas.assessment_id = 2
WHERE 
    sas.student_id IS NULL;
```

| given_name | family_name | 
|------------|-------------| 
| Michael    | Stonebraker | 
| Håkon Wium | Lie         |

The `AND` is part of the join condition. So we only include rows from the right side table (_student_assessment_scores_) if they match the _student_id_ number and the _assessment_id_ has a value of 2. 

We might think we could do this using `AND` in the `WHERE` clause e.g.

```sql
SELECT
    s.given_name,
    s.family_name
FROM
    students AS s
LEFT JOIN 
    student_assessment_scores AS sas 
    ON s.student_id = sas.student_id 
WHERE 
    sas.student_id IS NULL AND sas.assessment_id = 2;
```

This returns an empty result set because the `WHERE` clause is applied after the join. For students that didn't submit, _sas.assessment_id_ has a value of NULL and the condition won't be met. 


What about a 2 x left join like my airports example. 





## Left Join

The LEFT JOIN Use Case: Finding Inactive Records.

A LEFT JOIN keeps every single row from the left table, even if it cannot find a match in the right table. When a match is missing, the database pads the columns on the right with NULL.

The Business Scenario: The marketing team wants to find a list of all registered users who have never watched a single movie so they can send them a "Welcome back, here is a discount" email.

```
SELECT u.email_address, v.watched_at
FROM users u
LEFT JOIN viewings v ON u.user_id = v.user_id
WHERE v.viewing_id IS NULL;
```

## Right Join

The RIGHT JOIN Use Case: Checking Catalog Coverage

A RIGHT JOIN does the exact opposite: it keeps every single row from the right table, regardless of matches on the left.

The Business Scenario: The content curation team wants to find unpopular genres in the catalog. Specifically, they want a list of all genres that currently have zero movies assigned to them.

```
SELECT g.genre_name, gm.movie_id
FROM genre_movie gm
RIGHT JOIN genres g ON gm.genre_id = g.genre_id
WHERE gm.movie_id IS NULL;
```

This could also be written as a left join.