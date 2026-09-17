# SQL Subqueries
This lab is based on a flights scenario. An ERD for the database is shown below. 
- The database has already been set up and populated with sample data. Using the SQLTools extension, explore the database. Make sure you are familiar with the structure of the tables and you have viewed the data they contain. 
- Open _sql/flights_subqueries.sql_. Write SQL `SELECT` queries that answer each of the questions in the comments. 
    - Write your queries on a new line immediately after each question. 
    - Select your query and right-click to only run the selected query. 
    - Read the question carefully and make sure your query fully answers the question. 


```mermaid
erDiagram
    routes }o--|| airports : ""
    flights }o--|| routes : ""
    flights }o--o| aircraft : ""
    aircraft }o--|| aircraft_models : ""
    
    airports {
        CHAR(3) iata_code PK
        VARCHAR(255) name "NOT NULL"
        VARCHAR(100) city "NOT NULL"
        SMALLINT number_runways "NOT NULL"
    }

    routes {
        INT route_id PK
        CHAR(3) origin_airport FK "NOT NULL"
        CHAR(3) destination_airport FK "NOT NULL"
        INT distance_km "NOT NULL"
    }

    aircraft {
        VARCHAR(10) tail_number PK
        INT model_id FK
    }

    aircraft_models {
        INT model_id PK
        VARCHAR(255) manufacturer "NOT NULL"
        VARCHAR(255) model_name "NOT NULL"
        INT seat_capacity "NOT NULL"
    }

    flights {
        INT flight_id PK
        INT route_id FK  "NOT NULL"
        VARCHAR(10) tail_number FK  "NOT NULL"
        TIMESTAMP departure  "NOT NULL"
        TIMESTAMP arrival  "NOT NULL"
        DECIMAL base_price "NULL"
    }
```
