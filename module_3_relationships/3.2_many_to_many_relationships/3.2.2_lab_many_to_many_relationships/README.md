# Many-to-Many Relationship Joins
This lab is based on the following database.

```mermaid
erDiagram 
    languages||--o{movies : ""
    movies ||--o{genre_movie : ""
    genres ||--o{genre_movie : ""
    languages{
        CHAR(3) language_code PK
        VARCHAR(255) language_name
    }
    movies{
        INT movie_id PK
        VARCHAR(255) title 
        SMALLINT release_year
        SMALLINT duration_in_minutes
        CHAR(3) primary_language FK
    }
    genre_movie{
        INT genre_id PK, FK
        INT movie_id PK, FK
    }
    genres{
        INT genre_id PK
        VARCHAR(255) genre_name
        TEXT genre_description
    }
```
- The database has already been set up and populated with sample data. Using the SQLTools extension, explore the `movies` database. Make sure you are familiar with the structure of the tables, and you have viewed the data they contain. 
- Open _movies_many_to_many_queries.sql_. Write SQL `SELECT` queries that answer each of the questions in the comments. 
    - Write your queries on a new line immediately after each question. 
    - Select your query and right-click to only run the selected query. 
    - Read the question carefully and make sure your query fully answers the question. 
    - The first question has been completed for you.