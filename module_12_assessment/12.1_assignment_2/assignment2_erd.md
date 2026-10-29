# My Movie Diary Scenario

The web application you develop for Assignment 2 should be based on the 'My Movie Diary' example we looked at in Module 4 of the course. 

The database will be provided for you in the lab. 

A logical ERD for the database is shown below. 

There are some small changes from the final design we looked at in Module 4. 
- Added an `images` table to store filenames of movie poster images. Note that not all movies have an associated image. 
- Added a surrogate key to `viewings`. This should make it easier to perform joins using this table. 

**Updated Logical Model for the My Movie Diary Database**

<pre class="mermaid">
erDiagram
    languages ||--o{ movies : ""
    movies ||--|| images : ""
    movies ||--o{ reviews : ""
    movies ||--o{ viewings : ""
    users ||--o{ reviews : ""
    users ||--o{ viewings : ""
    movies ||--|{ genre_movie : ""
    genres ||--o{ genre_movie : ""

    users {
        INT user_id PK
        TEXT email_address  "NOT NULL"
        TEXT password  "NOT NULL"
    }
    viewings{
        INT viewing_id PK
        INT movie_id FK
        INT user_id FK
        TIMESTAMP viewing_date  "NOT NULL"
    }
    movies {
        INT movie_id PK
        TEXT title   "NOT NULL"
        INT release_year   "NOT NULL"
        INT duration_in_minutes   "NOT NULL"
        TEXT primary_language FK   "NOT NULL"
    }
    languages{
        TEXT language_code PK
        TEXT language_name   "NOT NULL"
    }
    images{
        INT image_id PK
        INT movie_id "UNIQUE NOT NULL"
        VARCHAR(255) filename "NOT NULL"
        TEXT alt_text "NOT NULL"
    }
    reviews {
        INT review_id PK
        INT movie_id FK   "NOT NULL"
        INT user_id FK   "NOT NULL"
        TIMESTAMP review_date   "NOT NULL"
        TEXT review_text   "NULL"
        INT rating   "NOT NULL"
    }
    genre_movie{
        INT genre_id PK, FK
        INT movie_id PK, FK
    }
    genres{
        INT genre_id PK
        TEXT genre_name   "NOT NULL"
        TEXT genre_description   "NOT NULL"
    }
</pre>