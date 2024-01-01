# sql_01, Here we have 2 queries: Sub and Flights.
After creating an database.
## - query 1:
Table Creation:
A table named sub was created with columns name, age, mark1, mark2, and mark3.
Data types: name (VARCHAR(8)), age (INT(5)), mark1, mark2, and mark3 (INT(4)).
Data Insertion:

Five tuples were inserted into sub with various values for name, age, and marks.
Column Addition:

Added a new column total (INT(5)) to the sub table.
Data Update:

Updated the age for a specific student.
Row Deletion:

Deleted a row where the name matched a specific value.
Column Modification:

Dropped the mark3 column, then re-added it with a different data type (INT(6)).
Table Data Deletion:

Deleted all data from the sub table.
Table Deletion:

Dropped the sub table entirely.

## - query 2:
Table Creation:

Created a table named flights with columns flno, fromplace, toplace, distance, departs, and arrives.
Data types: flno, fromplace, toplace (VARCHAR(50)), distance (DECIMAL(10)), departs, arrives (TIME).
Data Insertion:

Inserted five rows into the flights table with various values.
Column Addition:

Added a new column price (INT).
Data Update:

Updated the price for a specific flight.
Row Deletion:

Deleted a row based on fromplace.
Column Modification:

Dropped the distance column.
Renamed the price column to journey_price and changed its data type to INT(7).
Table Data Deletion:

Deleted all data from the flights table.

### Exp:
These operations demonstrate basic CRUD (Create, Read, Update, Delete) functionality in MySQL.
Ensure to select the appropriate database before performing these operations.
Handle data types and column constraints with care to avoid data inconsistency.
Regularly backup your database to prevent data loss.
