
Make sure they understrand that a junciton table isn't needed for 1NF

Do these questions as multi-choice

### Do a 1NF question where the table has been flattened but we still have duplicate data
It makes it clear that junction tables aren't needed to 1NF

### Nice 1NF example
| order_id (PK) | item_id (PK) | item_name  | quantity        |
| :------------ | :----------- | :--------- | :-------------- |
| 5001          | 101          | Mozzarella | 50 kg           |
| 5001          | 102          | Pepperoni  | 20 kg           |
| 5002          | 101          | Mozzarella | 30 kg           |
| 5003          | 103          | Flour      | 100 kg          |
| 5003          | 104          | Soft Drink | 12.00 litres    |

## 2NF Histroy tracking trap

| professor_id (PK) | course_id (PK) | academic_year (PK) | term_name (PK) | textbook_budget |
| :---------------- | :------------- | :----------------- | :------------- | :-------------- |
| PROF_101          | CS_101         | 2025               | Winter         | £500            |
| PROF_101          | CS_202         | 2026               | Spring         | £750            |
| PROF_102          | CS_101         | 2026               | Spring         | £450            |
| PROF_101          | CS_101         | 2026               | Winter         | £550            |


### This is a 3NF questions
We can ask is this table in 1NF
Is this table in 2NF
| tournament_id (PK) | player_id (PK) | registration_fee| player_name     | team_name  |
| :----------------- | :------------- | :---------------| :-------------- | :--------- |
| T100               | P44            | 50              | Marcus Rashford | Man United |
| T100               | P88            | 50              | Bukayo Saka     | Arsenal    |
| T200               | P44            | 120             | Marcus Rashford | Man United |
| T200               | P11            | 120             | Erling Haaland  | Man City   |

### Have a completely 3NF table with duplicate data

## Functional Dependencies

## 3NF

| team_id (PK) | team_name   | sponsor_name | sponsor_email        |
| :----------- | :---------- | :----------- | :------------------- |
| T1           | Man United  | Adidas       | support@adidas.com   |
| T2           | Arsenal     | Emirates     | contact@emirates.com |
| T3           | Real Madrid | Emirates     | contact@emirates.com |
| T4           | Man City    | Puma         | info@puma.com        |

