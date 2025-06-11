# University Database Project



## Group Members

Safee Ullah Khan 241800
Abuzar Ghafari   241788



## Project Title and Description

**Project Title:** University Management Database System

**Description:**
This project involves the design, implementation, and sample data population of a relational database for managing a university's core operations. 
The database, named `UniversityDb`, handles various entities such as departments, faculty, students, courses, enrollments, exams, results, assignments, classrooms, schedules, fees, attendance, and administrative users.

The primary goal of this database is to provide a structured and efficient way to store and retrieve information crucial for the daily functioning of a university, facilitating academic tracking, administrative tasks, and reporting.

---

## Setup Instructions

To set up and run this database project on your local machine, follow these steps:

### 1. Restore the Database

This project assumes you are using **SQL Server Management Studio (SSMS)** or a compatible SQL Server client.

1.  **Open SQL Server Management Studio (SSMS).**
2.  **Connect to your SQL Server instance.**
3.  **Create a new database:**
    * Right-click on "Databases" in the Object Explorer and select "New Database...".
    * Enter `UniversityDb` as the Database name and click "OK".
4.  **Execute the Schema and Data Script:**
    * Open a new query window in SSMS (File > New > Query with Current Connection).
    * Copy and paste the entire SQL script provided (the `CREATE TABLE` and `INSERT INTO` statements) into this query window.
    * Ensure that `USE UniversityDb;` is at the top of your script.
    * Click "Execute" or press `F5` to run the script. This will create all the tables and populate them with the sample data.

### 2. Run Sample Queries

Once the database is set up and populated, you can run various queries to interact with the data.

1.  **Open a new query window in SSMS.**
2.  **Ensure you are using the correct database:**
    ```sql
    USE UniversityDb;
    GO
    ```
3.  **Copy and paste any of the provided sample queries into the query window.**
    * **Data Retrieval (SELECT):** Examples are provided for fetching student information, course details, enrollment records, exam results, and more.
    * **Data Modification (UPDATE):** Examples for changing student emails, faculty designations, fee statuses, etc.
    * **Data Deletion (DELETE):** Examples for removing records. **Exercise caution with DELETE statements, as they permanently remove data.**

4.  **Execute the query** by clicking "Execute" or pressing `F5`. The results will appear in the results pane.

---
