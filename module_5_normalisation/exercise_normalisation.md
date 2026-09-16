
A small college offer courses to people living in the local community. If local residents sign-up and pay a small annual fee they can become members, this allows them to book onto two courses a year. Optionally, residents can take out gold membership which allows them to book onto an unlimited number of courses. Many courses require equipment e.g. sewing machines, scissors and fabric are needed for the dressmaking course. Although some pieces of equipment are provided by the college, members are often also required to bring their own.  

They have a simple database that keeps track of the different classes they offer, the equipment needed and who has booked on which class.

**bookings**
| member_id | class_code | class_name          | member_name   | membership_type | annual_fee | provided_equipment                           | member_equipment                   | start_date | end_date   |
| :-------- | :--------- | :------------------ | :------------ | :-------------- | :--------- | :------------------------------------------- | :--------------------------------- | :--------- | :--------- |
| 1         | 2          | Table Tennis        | Rob Jones     | gold            | 50         | Table tennis tables, nets, balls             | Table tennis bat                   | 01-01-2026 | 01-03-2026 |
| 2         | 2          | Table Tennis        | Clare Smith   | basic           | 10         | Table tennis tables, nets, balls             | Table tennis bat                   | 01-01-2026 | 01-03-2026 |
| 1         | 3          | Pilates             | Rob Jones     | gold            | 50         | NULL                                         | Yoga mat                           | 10-01-2026 | 11-03-2026 |
| 1         | 4          | Digital Photography | Rob Jones     | gold            | 50         | Studio lights   | Digital camera, Laptop                     | 12-01-2026 | 13-03-2026 |
| 3         | 2          | Table Tennis        | Imran Hussain | basic           | 10         | Table tennis tables, nets, balls             | Table tennis bat                   | 01-01-2026 | 01-03-2026 |
| 1         | 5          | Dressmaking         | Rob Jones     | gold            | 50         | Sewing machines, mannequins                  | Fabric, matching thread, scissors  | 21-01-2026 | 20-03-2026 |
| 3         | 6          | Creative writing    | Imran Hussain  | basic           | 10         | NULL                                         | Laptop    | 21-01-2026 | 20-03-2026 |

## 1NF

Ask them to add the junction tables. e.g. feel free to split the table in multiple tables and use FK or junction tables. 

### 1. Main Bookings Table (1NF)
*Note: All cell values are now atomic. This table operates on a composite primary key of `(member_id, class_code)`.*

| member_id (PK) | class_code (PK) | class_name          | given_name | family_name | membership_type | annual_fee | start_date | end_date   |
| :------------- | :-------------- | :------------------ | :--------- | :---------- | :-------------- | :--------- | :--------- | :--------- |
| 1              | 2               | Table Tennis        | Rob        | Jones       | gold            | 50         | 01-01-2026 | 01-03-2026 |
| 2              | 2               | Table Tennis        | Clare      | Smith       | basic           | 10         | 01-01-2026 | 01-03-2026 |
| 1              | 3               | Pilates             | Rob        | Jones       | gold            | 50         | 10-01-2026 | 11-03-2026 |
| 1              | 4               | Digital Photography | Rob        | Jones       | gold            | 50         | 12-01-2026 | 13-03-2026 |
| 3              | 2               | Table Tennis        | Imran      | Hussain     | basic           | 10         | 01-01-2026 | 01-03-2026 |
| 1              | 5               | Dressmaking         | Rob        | Jones       | gold            | 50         | 21-01-2026 | 20-03-2026 |
| 3              | 6               | Creative writing    | Imran      | Hussain     | basic           | 10         | 21-01-2026 | 20-03-2026 |

### 2. Master Equipment Table (1NF Lookup)
*A master catalog assigning a unique ID to every single piece of physical gear. Notice that "Laptop" is only stored once here.*

| equipment_id (PK) | equipment_name         |
| :---------------- | :--------------------- |
| 201               | Table tennis tables    |
| 202               | Nets                   |
| 203               | Balls                  |
| 204               | Table tennis bat       |
| 205               | Yoga mat               |
| 206               | Studio lights          |
| 207               | Digital camera         |
| 208               | Laptop                 |
| 209               | Sewing machines        |
| 210               | Mannequins             |
| 211               | Fabric                 |
| 212               | Matching thread        |
| 213               | Scissors               |

### 3. Class_Provided_Equipment Table (1NF Junction)
*Maps which master equipment items are provided by the college for a given class.*

| class_code (PK) | equipment_id (PK) |
| :-------------- | :---------------- |
| 2               | 201               |
| 2               | 202               |
| 2               | 203               |
| 4               | 206               |
| 5               | 209               |
| 5               | 210               |

### 4. Class_Member_Equipment Table (1NF Junction)
*Maps which master equipment items the member must bring themselves. Notice how cleanly item `208` (Laptop) maps to both class `4` and class `6` without duplicating text.*

| class_code (PK) | equipment_id (PK) |
| :-------------- | :---------------- |
| 2               | 204               |
| 3               | 205               |
| 4               | 207               |
| 4               | 208               |
| 5               | 211               |
| 5               | 212               |
| 5               | 213               |
| 6               | 208               |

## 2NF

### Second Normal Form (2NF) Solution

To achieve 2NF, we split the 1NF Main Bookings table to eliminate partial dependencies. This ensures that every non-key column depends completely on the entire primary key of its respective table.

#### 1. Members Table (2NF)
*Contains fields that depend strictly on `member_id`. Note: This table has a single-column primary key, so it passes 2NF, but it contains a transitive dependency that we will fix in 3NF.*

| member_id (PK) | given_name | family_name | membership_type | annual_fee |
| :------------- | :--------- | :---------- | :-------------- | :--------- |
| 1              | Rob        | Jones       | gold            | 50         |
| 2              | Clare      | Smith       | basic           | 10         |
| 3              | Imran      | Hussain     | basic           | 10         |

#### 2. Classes Table (2NF)
*Contains fields that depend strictly on `class_code`. This table is now fully normalized.*

| class_code (PK) | class_name          |
| :-------------- | :------------------ |
| 2               | Table Tennis        |
| 3               | Pilates             |
| 4               | Digital Photography |
| 5               | Dressmaking         |
| 6               | Creative writing    |

#### 3. Course_Bookings Table (2NF Bridge Table)
*Contains temporal attributes that strictly require the full combination of BOTH `member_id` and `class_code`.*

| member_id (PK/FK) | class_code (PK/FK) | start_date | end_date   |
| :---------------- | :----------------- | :--------- | :--------- |
| 1                 | 2                  | 01-01-2026 | 01-03-2026 |
| 2                 | 2                  | 01-01-2026 | 01-03-2026 |
| 1                 | 3                  | 10-01-2026 | 11-03-2026 |
| 1                 | 4                  | 12-01-2026 | 13-03-2026 |
| 3                 | 2                  | 01-01-2026 | 01-03-2026 |
| 1                 | 5                  | 21-01-2026 | 20-03-2026 |
| 3                 | 6                  | 21-01-2026 | 20-03-2026 |

## 3NF
### Third Normal Form (3NF) Solution

To achieve 3NF, we extract the transitive dependency (`member_id` $\rightarrow$ `membership_type` $\rightarrow$ `annual_fee`) out of the Members table. This completely eliminates data redundancy and prevents update anomalies if membership pricing changes in the future.

#### 1. Memberships Lookup Table (3NF)

| membership_type (PK) | annual_fee |
| :------------------- | :--------- |
| gold                 | 50         |
| basic                | 10         |

#### 2. Final Members Table (3NF)
*The `membership_type` column is now a foreign key linking back to our lookup table.*

| member_id (PK) | given_name | family_name | membership_type (FK) |
| :------------- | :--------- | :---------- | :------------------- |
| 1              | Rob        | Jones       | gold                 |
| 2              | Clare      | Smith       | basic                |
| 3              | Imran      | Hussain     | basic                |




## Exercise: Normalizing the Furniture Shop Registry

Below is a raw log sheet used by a local furniture warehouse to track orders, customers, and inventory.

[INSERT RAW SPREADSHEET TABLE HERE]

### Part 1: Diagnostic
1. Identify **two** distinct anomalies that could occur if we leave this table as it is.
2. List all the functional dependencies present in this dataset using `Column A -> Column B` notation.

### Part 2: Step-by-Step Normalization
1. Convert this table into **First Normal Form (1NF)**. State your primary key(s) clearly.
2. Take your 1NF layout and normalize it to **Second Normal Form (2NF)**. Explain which partial dependencies you removed.
3. Take your 2NF layout and normalize it to **Third Normal Form (3NF)**. 

### Part 3: Verification
Write a single SQL query using `JOIN` statements that reconstructs your final 3NF tables back into the original registry view shown at the top of this page.
