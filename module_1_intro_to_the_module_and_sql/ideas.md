# Databases


```mermaid
erDiagram
    routes }o--|| airports : origin
    routes }o--|| airports : destination
    flights }o--|| routes : route
    flights }o--|| aircraft_instances : assigned_plane
    aircraft_instances }o--|| aircraft_models : model
    flight_crew_assignments }o--|| flights : flight
    flight_crew_assignments }o--|| crew : crew_member

    airports {
        char(3) iata_code PK
        varchar(255) name
        smallint number_runways
    }
    routes {
        int route_id PK
        char(3) origin_airport FK
        char(3) destination_airport FK
        varchar(10) flight_number
    }
    aircraft_models {
        int model_id PK
        varchar(50) manufacturer
        varchar(50) model_name
        int seat_capacity
    }
    aircraft_instances {
        varchar(10) tail_number PK
        int model_id FK
        varchar(20) status
    }
    flights {
        int flight_id PK
        int route_id FK
        varchar(10) tail_number FK
        timestamptz departure
        timestamptz arrival
    }
    crew {
        int crew_id PK
        varchar(100) first_name
        varchar(100) last_name
        varchar(30) job_title
    }
    flight_crew_assignments {
        int flight_id PK, FK
        int crew_id PK, FK
        varchar(30) assigned_role
    }


```
- Tailnumber can be null as we create flights before assigning planes
- Add constraints for checking flight times
- Name of crew
- Shouldn't assigned_role be an FK. or drop it altogether just M:M crew to flights



```mermaid
erDiagram

sightings }o--|| spotters : "spotted by"
sightings }o--|| species : "of"

sightings{
    int sighting_id PK
    timestamptz observed_at
    int species_id FK
    int spotter_id FK
    decimal latitude
    decimal longitude
    text notes
}

spotters{
    int spotter_id PK
    varchar(255) given_name
    varchar(255) family_name

}

species{
    int species_id PK
    varchar(255) species_name
}

```

- add conservation status
- somekind of category for the species e.g. mammal