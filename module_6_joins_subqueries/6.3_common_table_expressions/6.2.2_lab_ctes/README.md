# SQL Subqueries
This lab is based on the following database.

```mermaid
erDiagram
    routes }o--|| airports : ""
    routes }o--|| airports : ""
    flights }o--|| routes : ""
    flights }o--|| aircraft : ""
    aircraft }o--|| aircraft_models : ""
    
    airports {
        char(3) iata_code PK
        varchar(255) name
        varchar(100) city
        smallint number_runways
    }

    routes {
        int route_id PK
        char(3) origin_airport FK
        char(3) destination_airport FK
    }

    aircraft {
        varchar(10) tail_number PK
        int model_id FK
    }

    aircraft_models {
        int model_id PK
        varchar(255) manufacturer
        varchar(255) model_name
        int seat_capacity
    }

    flights {
        int flight_id PK
        int route_id FK
        varchar(10) tail_number FK
        timestamptz departure
        timestamptz arrival
        numeric base_price 
    }
```

- The database has already been set up and populated with sample data. Using the SQLTools extension, explore the `flights` database. Make sure you are familiar with the structure of the tables, and you have viewed the data they contain. 
- Open _movies_many_to_many_queries.sql_. Write SQL `SELECT` queries that answer each of the questions in the comments. 
    - Write your queries on a new line immediately after each question. 
    - Select your query and right-click to only run the selected query. 
    - Read the question carefully and make sure your query fully answers the question. 
    - The first question has been completed for you.