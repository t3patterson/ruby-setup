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

###Accessing & Using MYSQL from the terminal
assuming it's installed....
1. In the terminal: `mysql -u root -p`
2. Enter db password
3. You should see MYSQL prompt in terminal  
  ```
  mysql> 
  ```
4. Within the mysql prompt, create A New MYSQL User and give it priveleges to use the db
  ```
  mysql> GRANT ALL PRIVELEGES ON «db_name».*
  mysql> TO '«user_name»'@'localhost'
  mysql> IDENTIFIED BY '«password»';
  ```  
  Note: `.*` is a wildcard: specified privileges will have access to all tables

5. From the terminal, we can now login with:  
   `mysql -u «user_name» -p «db_name»`  
   and give it the password

###Configuring the Rails Database
- Rails has 3 environments:
  1. Development
  2. Production
  3. Testing  
  
  We will configure Development and Production differently...For example in development we may want all error details to be visibile. We can release a db for production and keep working on the development.

- Rails database settings is configured in `database.yml`
  - `.yml` (YAML) is a way of structuring a simple text file
  -  the `database.yml` has default settings and specific settings for development, test, and production
  -  some of the configuration settings: 
    - `adapter` = database type
    - `username` = enter in username that was created
    - `socket` = location of `mysql.soc` file mysql uses when making connections

- `rake db:schema:dump` tells rails to connect to the db and export the schema . Look for output in `./db/schema.rb`

###Rake
Rake is a command line program that is written in Ruby. Runs scripts known as 'tasks'
- Uses `Rakefile` in the root directory
- In the command line: `rake -T` will show the tasks (also `rake -T db` will show the db tasks)
- for working with the database, typical syntax looks like `rake db:«task»`

