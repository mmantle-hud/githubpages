---
layout: base
title: Test 
---


# SQL
SQL is the language used to interact with a relational database. 

There are minor differences between database management systems, but the core parts of the language that we will learn work across all database management systems e.g. Oracle, SQLServer, MySQL. 

The SQL language is made up of four distinct parts:-

|Language                          |Example Commands              -|Description|
|----------------------------------|-------------------------------|-----------|
|DDL (Data Definition Language)    |CREATE, ALTER, DROP            | This is used to define the structure of our databases and the tables and columns.|
|DML (Data Manipulation Language)  |SELECT, INSERT, UPDATE, DELETE | This is used to manipulate the data that lives in our database. For example to insert, retrieve, modify and delete data|
|DCL (Data Control Language)       |GRANT, REVOKE.                 |This is used to specifying which users have access to which databases and what actions they can perform.
|TCL (Transaction Control Language)| COMMIT, ROLLBACK.             |This is used to specify how and if changes we've specified should be executed.|

Although we will also look at the TCL aspects. In practice, we will spend most of our time using SQL as a DDL and DML. 

## CREATE statement

<!-- The best was to learn SQL is to jump straight in and start writing it.  -->

Imagine I want to use a relational database to help keep track of the students on my course and the marks they have obtained.

<!-- Relational databases store data in tables.  -->

We use a separate table to store data about each real world type of thing or entity we are interested. 

In my simple example, I want to store data about students, so I'd create a _students_ table and it might look like the following:

| given_name | family_name   | degree                  | mark |
|------------|---------------|-------------------------|------|
| Edgar      | Codd          | Computing               | 92   |
| Elizabeth  | Fong          | Data Science            | 67   |
| Donald     | Chamberlin    | Information Technology  | 85   |
| Patricia   | Selinger      | Computing               | 85   |
| Michael    | Stonebraker   | Data Science            | 34   |
| Jennifer   | Widom         | Computing               | 47   |

In this scenario I have students from different degrees all studying a course. 

This isn't a very well-designed table, but for now it's good enough for us to learn some key things about SQL. 

To create a table like this in SQL we use the CREATE statement:-

```sql
CREATE TABLE students (
    given_name VARCHAR(255),
    family_name VARCHAR(255),
    degree VARCHAR(255),
    mark SMALLINT
);
```

SQL is a declarative language. We state what we want to achieve, not step by step how to complete the task. The database management system takes care of the details. 

- CREATE and TABLE are keywords from the language that declare we want to create a table We then specify the name of the table, in this example _students_. 
- In parentheses, separated by a commas, we specify the columns. Each column has a name that we invent and the type of data that can be stored.
 - In this table, the first three rows all store text data. VARCHAR specifies variable length text and the 255 specifies the maximum number of characters.
- The final column _mark_ is going to store a number, the student's mark, so we specify SMALLINT, a small integer.

There are lots of data types we can use for text, numbers and dates. I won't go through them all. We'll discuss them as they come up. 

The basic rule is we should choose the most specific and smallest data type. For example, there is a TEXT data type which has unlimited length and is used for long descriptions e.g. if storing a news article. We choose VARCHAR(255) because it clearly indicates a small string, but is flexible enough to support different length names. 

## Primary Key

When performing an operation such as update or delete, we need to specify which row we want to affect. If we aren't completely clear about which row we are referring to, we could accidentally change or delete the wrong row. For this reason each row needs a unique identifier. We call this a **primary key**. 

**A primary key is a column or group of columns that uniquely identify a row.**

<!-- If you know a primary key value you know which single, specific row is being referred to.  -->

So which column could we use for our primary key? Immediately we can rule out _degree_, more than a single student studies the same degree. The same is true for _mark_; more than a single student can have the same mark. 

At the moment _given_name_ could be used, each student's _given_name_ is unique. However, eventually there are going to be two students with the same _given_name_. 

<!-- What about _family_name_, if there are hundreds of students taking the course, it wouldn't be unusually for two of them to share the same family name.  -->

We can use a combination of columns. So we could use the combination of _given_name_ and _family_name_. This is better, but would still suffer from the same issue. It wouldn't be unusual to have two students called 'Jane Smith' or 'Mohammed Hussain' on the course. 

If there isn't a suitable column or group of columns, we simply add a new column to the table, the column has an integer data type, and the only purpose of this column is to act as a primary key. 

The following shows the addition of a _student_id_ column that fulfils the role of primary key. We call this a surrogate primary key. It is a "made-up" column that has no real-world meaning. It exists purely for the database's benefit.

|student_id| given_name | family_name   | degree                  | mark |
|----------|------------|---------------|-------------------------|------|
|1         | Edgar      | Codd          | Computing               | 92   |
|2         | Elizabeth  | Fong          | Data Science            | 67   |
|3         | Donald     | Chamberlin    | Information Technology  | 85   |
|4         | Patricia   | Selinger      | Computing               | 85   |
|5         | Michael    | Stonebraker   | Data Science            | 34   |
|6         | Jennifer   | Widom         | Computing               | 47   |

Now, if I want to perform an operation such as update a student mark, I can state something like 'update row number 6, change the mark to 51'. There is and will only ever be one row with a _student_id_ value of 6. 

Here's the updated CREATE TABLE statement with the primary key added.

```sql
CREATE TABLE students (
    student_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255),
    family_name VARCHAR(255),
    degree VARCHAR(255),
    mark SMALLINT,
    CONSTRAINT pk_students PRIMARY KEY (student_id),
);
```
The _student_id_ column will store an integers. GENERATED ALWAYS AS IDENTITY means PostgreSQL will generate the id numbers automatically. 

<!-- When we insert new rows we won't specify the _student_id_ value PostgreSQL will simply assign the next available number.   -->

<!-- GENERATED: Tells the database that it is responsible for producing the values for this column.
ALWAYS: Enforces a strict rule that the database will always handle this column. 
AS IDENTITY: Specifies that the automatic generation should follow the "Identity" rules—meaning it implicitly links the column to an internal sequence generator that dishes out unique numbers (e.g., 1, 2, 3...) every time a new row is added. --> 

At the end of the statement we also declare a constraint.

 **A constraint is simply a rule that we apply to a table to make sure the data we add is accurate and reliable.** 

In this case the rule states the _student_id_ column will be the primary key.
- CONSTRAINT is a keyword, we then name the constraint _(pk_students)_, specify the type of constraint _(PRIMARY KEY)_ and the column we are constraining _(student_id)_. 

By declaring this column a primary key we are saying two things. First, it must always have a value i.e. it can't be empty (or NULL), and secondly it must be unique, no two rows can have the same primary key value.

This rule will be enforced by PostgreSQL. If we try and insert a new row without following this rule PostgreSQL will refuse to complete the operation and display an error message. 

### NULL and NOT NULL
Let's think about some other constraints. When we create a table we can decide if columns should allow NULL values. 

```sql
CREATE TABLE students (
    student_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255) NOT NULL,
    family_name VARCHAR(255) NULL,
    degree VARCHAR(255) NOT NULL,
    mark SMALLINT NULL,
    CONSTRAINT pk_students PRIMARY KEY (student_id)
);
```
NULL is the absence of a value. So now we are saying whenever we insert a new student's details into the table we **must** specify a value for the _given_name_ and _degree_ fields. 

What about the _family_name_ and _mark_ columns? In this CREATE statement I'm stating they can be NULL i.e. we don't have to specify a value. This makes sense as in some countries e.g. Myanmar, people are only known by their given name, they don't have a last name or family name. 

<!-- e.g. Sai Sai Kham Leng is a Burmese pop star. -->

For the _mark_ column, I might want to add students to my database at the start of teaching and only add a mark later once they have completed the assessment. 

If I declared the column NOT NULL I'd always have to enter a mark whenever I enter a student.   

<!-- The other use case for using null is when a column might not be applicable. For example, if we had a middle name column. Not everyone has a middle name so we would allow this column to be nullable. -->

### Other Constraints

```sql
CREATE TABLE students (
    student_id INT GENERATED ALWAYS AS IDENTITY,
    given_name VARCHAR(255) NOT NULL,
    family_name VARCHAR(255) NULL,
    degree VARCHAR(255) NOT NULL,
    mark SMALLINT NULL,
    CONSTRAINT pk_students PRIMARY KEY (student_id),
    CONSTRAINT chk_students_mark CHECK (mark BETWEEN 0 AND 100)
);
```

In PostgreSQL, the SMALLINT data type has a range from -32768 to +32767. 

Obviously, we wouldn't want to award someone a mark of -72 or 32000. So we add a CHECK constraint.

In this example, the CHECK constraint states the value in the _mark_ column must be between 0 and 100. 

<!-- There are other CHECK constraints we can perform. For example, we can compare two columns. This example might be for a hotel booking system where we want to make sure the checkout date is after the check in date. 

```sql
...
CONSTRAINT chk_booking_dates CHECK (check_out_date > check_in_date)
...
```

We can use a UNIQUE constraint to specify all values should be unique. 

```sql
...
CONSTRAINT uq_users_email UNIQUE (email)
``` -->

## Writing SQL

- SQL isn't case-sensitive. However, it is a convention to place keywords (words that have meaning in the language) in capitals and identifiers (the names of tables and columns) in lower-case. 
    - PostgreSQL converts all uppercase letters to lowercase, so it's a good idea to use lowercase for all the letter in our identifiers. 
    - We can only use single words for identifiers. If an identifier is made up of two or more words e.g. _family name_. We use 'snake case' i.e. _family_name_. 

<!-- If we want to use uppercase letters we would have to place the identifier in double quotes. This is usually considered a case of adding unnecessary complexity so stick to lower-case. -->

- SQL doesn't care about line breaks, but it's a good idea to apply some basic formatting to queries. 

- A semicolon indicates the end of the query.

### Naming Conventions
It is considered good practice to adopt consistent naming conventions when creating tables. The rules used in my examples are fairly standard:-
- Give tables plural names i.e. _students_ not _student_.
- Give columns singular names.
- Name surrogate primary key columns with the singular version of the table name followed by id e.g. _student_id_.
- Name primary key constraints pk_table_name e.g. pk_students.
- Name CHECK constraints chk_table_name_column_name e.g. chk_students_mark.

### Inserting Data
To add data to a table we use an INSERT statement.

```sql
INSERT INTO students (given_name, family_name, degree, mark)
    VALUES ('Edgar','Codd','Computing',92);
```
The table would then look like:

|student_id| given_name | family_name   | degree                  | mark |
|----------|------------|---------------|-------------------------|------|
|1         | Edgar      | Codd          | Computing               | 92   |

We specify the columns we are inserting into and the values we want to insert. 

Note we didn't specify a _student_id_ value. This is because when we created the table we specified that PostgreSQL should generate this student_id number for this.

We can insert multiple rows, for example:-

```sql
INSERT INTO students (given_name, family_name, course, mark) 
VALUES
('Elizabeth', 'Fong', 'Data Science', 67),
('Patricia', 'Selinger', 'Computing', 85),
('Donald', 'Chamberlin', 'Information Technology', 85),
('Michael', 'Stonebraker', 'Data Science', 34),
('Jennifer', 'Widom', 'Computing', 47);
```
#### Inserting Text
When inserting data we enclose strings in quotes. However, the text we are inserting may already contain quotes. 

We can escape the quote by using a double quote '' e.g. 'O''Conner'

```sql
INSERT INTO students (given_name, family_name, degree, mark)
    VALUES ('Susan','O''Conner','Computing',67);
```

### Updating Data
UPDATE is used to modify the data in a table. For example to change a student's mark:

```sql
UPDATE students
SET mark = 85
WHERE student_id = 7;
```

The primary key value makes it absolutely clear which row we want to change. 

We can update multiple values at once, for example

```sql
UPDATE students
SET
    course = 'Data Science',
    mark = 92
WHERE student_id = 1;
```

We simply separate the columns to be updated with commas.

### Deleting Data
DELETE removes a row from a table. For example, a student decides to leave the module:

```sql
DELETE FROM students
WHERE student_id = 1;
```

We can delete multiple rows based on a condition e.g. remove all the students that haven't passed.

```sql
DELETE FROM students
WHERE mark < 40;
```

### Selecting Data
- The most commonly used SQL statement is SELECT. It is used to retrieve data from the database.
- To select data we use the keyword SELECT, we then specify the columns we want to retrieve and finally the name of the table we want to get the data from e.g.

```sql
SELECT given_name, family_name FROM students;
```
Would result in:-

| given_name | family_name   |
|------------|---------------|
| Edgar      | Codd          |
| Elizabeth  | Fong          |
| Patricia   | Selinger      |
| Donald     | Chamberlin    |
| Michael    | Stonebraker   |
| Jennifer   | Widom         |

An asterisk is used as a shorthand to select all columns.

```sql
SELECT * FROM students;
```

|student_id| given_name | family_name   | degree                  | mark |
|----------|------------|---------------|-------------------------|------|
|1         | Edgar      | Codd          | Computing               | 92   |
|2         | Elizabeth  | Fong          | Data Science            | 67   |
|3         | Donald     | Chamberlin    | Information Technology  | 85   |
|4         | Patricia   | Selinger      | Computing               | 85   |
|5         | Michael    | Stonebraker   | Data Science            | 34   |
|6         | Jennifer   | Widom         | Computing               | 47   |

- This is useful when we quickly want to test a query. We should never use it in production code. It is important to explicitly state the data we want to retrieve for clarity, security and performance reasons.



