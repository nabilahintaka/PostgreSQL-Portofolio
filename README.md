# PostgreSQL-Portofolio

Welcome to my Data Analyst Portfolio! I am a data analyst with experience in using various tools and technologies. I am proficient in data tools such as Python, SQL, BigQuery, Excel, Power BI, Tableau and Looker Studio. 

This is a repository to showcase my data analytics skills and projects that i get during my studies using *PostgreSQL*

# Objectives
- Able to apply normalization to data
- Designing ERD from existing problems
- Able to create database in PostgreSQL (DDL)
- Able to create tables with queries (DDL)
- Able to fill data into table (DML)

---

# Dataset Information
The dataset used is already in the repository with the name movies.csv. Here is the column information:

|Column|Data Type|
|---|---|
|id|Varchar|
|title|Varchar/Text|
|type|Varchar/Text|
|description|Varchar/Text|
|release_year|Integer|
|age_certification|Varchar/Text|
|runtime|Integer|
|genre|Array|
|production_countries|Array|

---

You are a Data Engineer who is asked to manage movie data for a streaming service provider. You need to do the following steps:

# 1. Create Database
  Create a database to store the movie data available in the movies.csv file.
# 2. Create Staging Table
  Create a `Staging` table to store temporary data, then insert csv data into the table with the following query example:
  ```sql
COPY Tabel_Name(col1, col2, col3, col4, col5)
FROM 'C:\tmp\persons.csv'
DELIMITER ','
CSV HEADER;
```
# 3. Normalizing Data
- Normalize the movie data from the movies.csv file. You need to create a table structure according to the normalization process until it reaches its simplest form (1NF, 2NF, or up to 3NF).
# 4. Creating Tables and Filling Data
- Use DDL (Data Definition Language) to create the tables from step 3, then use DML (Data Manipulation Language) to insert the data into the tables from the movies.csv file.
- To insert data from a direct SQL query, you can follow this example:
```sql
INSERT INTO NEW_TABEL(col1,col2,col3) SELECT col1,col2,col3 FROM TABLE
```
# 5. Database Testing
Once the table is successfully created, run the following query to test the database you created:

1. Display all movies with their genre and country of production.
2. The most popular movie genres.
3. The country that makes the most movies.
