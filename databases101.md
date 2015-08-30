##Database Fundamentals

###About Databases
- Databases are *like* spreadsheets
  - Rows are individual **records** (e.g. each customer)
  - Columns are **fields** (e.g. name, city, price)
  - The different tabs are **tables**  
- But a database is different from a spreadsheet because it **is** a set of tables
- A database can define and connect *relationships* between tables. We can issue commands to interact with the database to manipulate and  work with *subsets* of the databse.

###Databases w/ rails
- Set of tables
- one database = one application
- access permissions are granted at databases lvl
...
- **Table**
  - Set of columns and rows
  - 1 table = 1 model
  - Represents a single concept (e.g. products, customers, orders)
- **Column**
  - Set of data of single simple type
  - Examples: id, first_name, last_name, email, password
- **Row**
  - Single record of data
  - Example: "832214" | "Travis" | "Patterson" | "t3patterson@gmail.com"  | "superscrtpAssW0rd"
- **Field**
  - Intersection of a column and row 
  - e.g.    id:"832214" +++ 'first_name'  ==> 'Travis'
- **Foreign Key**
  - Table column whose values reference rows in another table
  - This is the *foundation* of relational databases
  - Example:
    - ** Table-1: Biographic Info **  
      ============================  
      **author** | year_of_birth | ethnicity | year_of_death

    - ** Table-2: Library Info **  
      =============================  
      book | **author** | year_published
  - Always put *indexes*
- **Schema**
  - Structural definition of a database
  - Tables and links
- Database Verbs: **CRUD**
  - Create / Read / Update / Delete