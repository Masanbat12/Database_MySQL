# sql_02, Here we have 2 queries: customers and emp. and table creation.
### After creating an database. The database consists of 2 tables named customers and emp, and virtualclinic tables 
## - query 1:
### Table: customers
cid (int): Customer ID, primary key.
cname (varchar(50)): Customer name.
age (int(3)): Age of the customer.
address (varchar(100)): Address of the customer.
city (varchar(20)): City where the customer resides.
postalcode (int(10)): Postal code of the customer's area.
gender (varchar(5)): Gender of the customer.
country (varchar(20)): Country of the customer.
Data Insertion
Sample data has been inserted into the customers table for testing and development purposes. This includes various customers with different attributes.

## Queries:
Several SQL queries are provided for common use cases:

Customers in Specific Cities (Haifa or Tel-Aviv) in Israel:

Retrieves all customers living in either Haifa or Tel-Aviv, Israel.
Customers with No Address:

Lists customer IDs and names for those who do not have an address on record.
Count of Female Customers:

Counts the total number of female customers in the database.
Customers from Afula (Limited to 3):

Retrieves information for up to three customers from Afula.
Customers Sorted by Age in Descending Order:

Lists all customers, sorted by age in descending order.
Count of Customers with Names Ending in 'a' or 'h':

Counts the number of customers whose names end with either 'a' or 'h'.
Customers with Specific Postal Code and Name Patterns:

Retrieves customers with postal codes starting with '5' and names starting with 's', 't', or 'p'.
Customers from Haifa, Hadera, or Netanya:

Lists customers living in Haifa, Hadera, or Netanya.

## - query 2:

### Table: emp
eno (int): Employee Number, primary key.
ename (varchar(50)): Employee Name.
phone_no (int(10)): Contact Phone Number.
desg (varchar(20)): Designation of the Employee.
salary (int): Employee's Salary.
age (int): Age of the Employee.
country (varchar(20)): Country of Residence.
Data Insertion
Sample data has been inserted into the emp table for demonstration and development purposes. It includes various employees with distinct roles and salaries.

## Queries:
Several SQL queries are provided for common use cases:

Employee IDs and Names:

Retrieves employee numbers and names from the emp table.
Employees with Specific Salary Range (Excluding Certain IDs):

Fetches details of employees whose salaries fall within a specific range, excluding employees with specific employee numbers.
Employees with Names Starting with 'A' and Name Length Greater Than 4:

Selects employee names and designations for those whose names start with 'A' and are longer than four characters.
Distinct Countries Count:

Counts the number of distinct countries represented in the employee data.
Employees with Minimum Salary:

Retrieves information for employees who earn the minimum salary in the organization.
Salary Update:

Updates the salary to 25% of the current salary for employees earning less than 18,000.
Employee Names and Salaries Post Update:

Lists the names and updated salaries of all employees.

## The database virtualclinic consists of the following tables:

### Table: speciality
name (VARCHAR(50)): The name of the medical specialty.
description (VARCHAR(100)): A brief description of the specialty.

### Table: symptom
name (VARCHAR(50)): The name of the symptom.
description (VARCHAR(100)): A brief description of the symptom.

### Table: location
city (VARCHAR(50)): The city where the clinic or doctor is located.
zip (VARCHAR(50)): The ZIP/postal code for the location.
state (VARCHAR(50)): The state where the clinic or doctor is located.
country (VARCHAR(50)): The country where the clinic or doctor is located, defaulting to "Israel".
address (VARCHAR(50)): The street address of the clinic or doctor.

### Table: doctors
id (INT): A unique identifier for each doctor, set as the primary key.
name (VARCHAR(50)): The name of the doctor.
speciality_name (VARCHAR(50)): The name of the doctor's specialty, correlating with the speciality table.
location_city (VARCHAR(50)): The city where the doctor practices, relating to the location table.
experience_years (INT): The number of years the doctor has been practicing.

## Usage
The tables in the virtualclinic database are designed to work together to provide a comprehensive overview of the clinic's operations. The speciality and symptom tables can be used to categorize and detail various medical areas and symptoms. The location table is crucial for geographical data, while the doctors table links medical professionals to their respective specialties and locations.
