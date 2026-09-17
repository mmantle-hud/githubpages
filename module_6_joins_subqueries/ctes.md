# Common Table Expressions

A Common Table Expression (CTE) is a temporary result set that we can use in another query. Often we can use a CTE instead of using a subquery.

Previously, we looked at a derived table subquery that selects each student name and their highest score from the two assessments. 

```sql
SELECT
    s.given_name,
    s.family_name,
    best_scores.max_score
FROM
    students AS s
    INNER JOIN (
        SELECT
            student_id,
            MAX(score) AS max_score
        FROM
            student_assessment_scores
        GROUP BY
            student_id
    ) AS best_scores ON s.student_id = best_scores.student_id;
```

We can re-write this query using a CTE.

```sql
WITH best_scores AS (
    SELECT
        student_id,
        MAX(score) AS max_score
    FROM
        student_assessment_scores
    GROUP BY
        student_id
)
SELECT
    s.given_name,
    s.family_name,
    bs.max_score
FROM
    students AS s
    INNER JOIN best_scores AS bs ON s.student_id = bs.student_id;
```

- The CTE is the first bit (that starts `WITH`).
- We name the CTE (_best_scores_). 
- We write the CTE query in parentheses.
- We can then use the CTE in the query statement that follows it. The result of a CTE is not stored and exists only for the duration of the query.

Why would we do this? This is all about readability. CTEs allow us to breakdown queries into separate isolated parts, making the query more manageable. 

Here's another example, this time using a correlated subquery. 

```sql
SELECT
    degrees.degree_title,
    (
        SELECT
            COUNT(*) AS student_count
        FROM
            students
        WHERE
            students.degree_id = degrees.degree_id
    ) AS student_counts
FROM
    degrees;
```
Re-writing this query as a CTE

```sql
WITH student_counts AS (
    SELECT
        students.degree_id,
        COUNT(students.student_id) AS student_count
    FROM
        students
    GROUP BY
        students.degree_id
)
SELECT
    d.degree_title,
    COALESCE(sc.student_count, 0)
FROM
    degrees AS d
    LEFT JOIN student_counts AS sc ON d.degree_id = sc.degree_id;
```

CTEs aren't just used as a replacement for subqueries. We can also use CTEs to simplify complex `JOIN` statements.

For example, a typical requirement for this type of database would be to retrieve a list of all student names and their overall score for the course. 
- The overall score needs to be calculated using the individual assessment scores and the weightings of the different assessments. 

We could use a complex `JOIN` and `GROUP BY` strategy. 

```sql

SELECT
    s.given_name,
    s.family_name,
    COALESCE(
        ROUND(SUM(sas.score * a.assessment_weighting), 2),
        0.00
    ) AS overall_score
FROM
    students AS s 
    LEFT JOIN student_assessment_scores AS sas ON s.student_id = sas.student_id 
    LEFT JOIN assessments AS a ON sas.assessment_id = a.assessment_id
GROUP BY
    s.student_id,
    s.given_name,
    s.family_name
ORDER BY
    overall_score DESC;
```

Alternatively, we can use CTEs.

```sql
WITH assignment_scores AS (
    SELECT
        sas.student_id,
        a.assessment_id,
        ROUND(sas.score * a.assessment_weighting, 2) AS weighted_score
    FROM
        assessments AS a
        INNER JOIN student_assessment_scores AS sas ON a.assessment_id = sas.assessment_id
),
overall_scores AS (
    SELECT
        student_id,
        SUM(weighted_score) AS overall_score
    FROM
        assignment_scores
    GROUP BY
        student_id
)
SELECT
    s.student_id,
    s.given_name,
    s.family_name,
    COALESCE(os.overall_score, 0) AS final_score
FROM
    students AS s
    LEFT JOIN overall_scores AS os ON s.student_id = os.student_id
ORDER BY
    final_score DESC;
```

In this example we use multiple CTEs, we simply separate them with commas. The _overall_scores_ CTE uses the _assignment_scores_ CTE, which in turn is used by the main query.

The CTEs allow us to use a 'divide and conquer' approach. By splitting the query down into a series of steps, we can isolate each part of the query. Each part can be independently tested, making it is easier to build up the query in stages. 

<!-- Show the result of each query separately -->

A second benefit is the query becomes more readable. The version that only used JOINs is more complex to understand, the calculation happens in a single step within the `SELECT` clause, and we have to visualise a `LEFT JOIN` across several tables.   

## What happens under the hood

## This is Getting Confusing

It is understandable if you feel a bit overwhelmed by joins, subqueries and CTEs. Here's some simple advice to help you choose what you should use.

- Your default position should be to use JOINS.
- If the query starts to get unmanagable and too complex, use CTEs
- Subqueries are best used when you need to filter using the result of another query. Usually this means a scalar subquery e.g. find all the students that scored higher than the average score, or single column multi-value subqueries e.g. to filter using a list of calculated values. 




<!-- There are lots of options -->


<!-- 


This query finds the number of students studying the most popular degree.
```sql
SELECT MAX(student_counts.student_count) AS largest_degree_size             
FROM (
    SELECT students.degree_id, COUNT(students.student_id) AS student_count 
    FROM students
    GROUP BY students.degree_id
) AS student_counts;
```
Re-written using a CTE

```sql
WITH student_counts AS (
    SELECT students.degree_id, COUNT(students.student_id) AS student_count 
    FROM students
    GROUP BY students.degree_id
)
SELECT MAX(student_counts.student_count) AS largest_degree_size             
FROM student_counts;
```


```sql
WITH student_counts AS (
    SELECT students.degree_id, COUNT(students.student_id) AS student_count 
    FROM students
    GROUP BY students.degree_id
)
SELECT d.degree_title, sc.student_count
FROM degrees AS d 
INNER JOIN student_counts as sc ON d.degree_id = sc.degree_id;
```

Just the counts
```sql
SELECT degrees.degree_title,
(
SELECT COUNT(students.student_id) AS student_count 
    FROM students WHERE students.degree_id = degrees.degree_id
)AS student_counts
FROM degrees;
``` -->


