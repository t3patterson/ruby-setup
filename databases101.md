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
Rake is a command line program that is written in Ruby. Runs scripts known as 'tasks'. Rake is used for *database migrations*.
- Uses `Rakefile` in the root directory
- In the command line: `rake -T` will show the tasks (also `rake -T db` will show the db tasks)
- for working with the database, typical syntax looks like `rake db:«task»`

###Migrations
- Migrations are a set of db instructions written in Ruby and changes the db from one state to another. 
- When we add new tables to the db, add new columms, we are able to  for **move up** to a new state or **move down** to a previous state of the db.
- We use migrations to maintain db schema with application code. Our application depends on having the database in a certain state.
- Instructions are executable and repeatable
- Allows sharing changes to the db when the schema change
- Helps w versioning
- Allows writing Ruby instead of SQL for adding columns/tables. Migrations have access to rails application code

####Generating Migrations
1. In command line `rails generate migration «SomeTitle»` will create a migration file. Migration file provided in camel-case.
  - creates file in `./db/migrate/«timestamp»_«some_title».rb`
  - migration file contains method called `change` that describes the changes to make to the current database and how to undo those changes
2. You can also create migrations by generating a **Model**. Example: type `rails generate model User`
  - creates file in `./db/migrate/«timestamp»_«model_name»_«table_name(s)».rb`

####Editing migrations
Creating columns inside a migration file (e.g.`20150830225413_create_users.rb`)

Syntax: `t.column '«column_name»', '«column_type»' [, '«options»']`

Context:
```ruby
 def up :users do |t|
   
   #create column for 'first_name'...:string == MySQL's  VARCHAR  
   t.column "first_name", :string

   #create columns for created_at and updated_at for the records
   t.timestamps null: false
 end
```
- Table Column Types
  - `:string`
  - `:binary`
  - `:boolean`
  - `:date`
  - `:datetime`
  - `:decimal`
  - `:float`
  - `:integer`
  - `:string`
  - `:text`
  - `:time`

- Table Column Options
  - character limit - `:limit      =>  size` 
  - `:default    =>  value` 
  - `:null       =>  true/false`
  - `:precistion =>  number`
  - `:scale      =>  number`

Alt syntax: `t.«column_type» «column_name» [, '«options»']`
- example: `t.string "last_name", :limit => 50, :default => ""`

NOTE: Rails will automatically add primary-key-id.

When we run the migration, our database schema will update with any new columns/fields that we have added.

####Running Migrations
With `rake db:migrate` rails will run all the generated migrations that have not yet been run

After running migrations the `./db/schema.rb` file will contain the schema of the database (i.e. the tables and columns)

To go to a version, we type `db:migrate VERSION=«version_num»`

To check the current migration-state of the db, `rake db:migrate:status` will return like this in the command line:

```
database: simple_cms_development

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20150830213511  Do nothing yet
   up     20150830225413  Create users
```

**up** is a previous state of the db that is currently active and **down** is a later version that is not currently active. 

####Migration Methods
- Inside the `.rb` migration files, there are methods for various database actions that modify the db schema

#####Table Migration Methods
- `create_table (table,options) do |t|`...
- `drop_table(table)`
- `rename_table(table, new_name)`

#####Column Migration Methods
- `add_column(table, column, data_type, options)`
- `remove_column(table, column)`
- `rename_column(table, column, new_name)`
- `change_column(table, column, data_type, options)` - changes the column in-place non-destructively

#####Index Migration Methods
Indexes allow you to perform lookups on dbs more quickly. Use indexes on columns(fields) with a *foreign key* and on *fields that are *referenced frequently* (like username for example).
- `add_index(table, column, options)`
  - options:  
    `:unique => true/false`
    `:name => "your_custom_name`
- `remove_index(table, column)`

NOTE: on the `down` method in a migration file, it needs to execute the same migration methods in the `up` method but in reverse order with the reverse method (i.e. add_index ....` ---> `remove_index....`)

#####Migration Errors
- comment out executed code lines to get back on track
- keep migrations small and concise
- Test all migrations thoroughly in development
