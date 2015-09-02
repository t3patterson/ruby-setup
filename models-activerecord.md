##Models in Ruby

###ActiveRecord
Rails implementation of active record pattern. Allows us to retrieve database data and manipulate data as Ruby objects, not static rows. 

Active record understands the structure of the table, and can create/read/update/delete rows.

###ActiveRecord Example - Creating a database row
```ruby
user = User.new
user.first_name = "Travo"
user.save #SQL INSERT

user.last_name = "Wilson" 
user.save #SQL UPDATE

user.delete
```
Rails makes smart choices about which SQL to write.

###ActiveRelation (aka ARel)
- Added in Rails v3  
- an object oriented interpretatoin of relational algebra
- simplifies the generation of complex database queries by making small queries chainable
- queries don't execute until necessary

###ActiveRelation example
```ruby
users = User.where(:first_name => "Kevin")
users = users.order("last_name ASC").limit(5)
users = users.include(:articles_authored)

# SQL Generated
#---------------------
# SELECT users.* , articles.*
# FROM users
# LEFT JOIN articles ON (users.id = articles.author_id)
# WHERE users.first_name = 'Kevin'
# ORDER BY last_name ASC LIMIT 5
#
```
###Generating a model
1) Command line: `rails generate model «SomeName»`
2) Creates file in `./db/migrate/2039103330_create_«some_name»`
  - In file, creates Ruby class name `CreateSubjects` (that inherits from `ActiveRecord::Migration`)
  - Also creates methods  
    ```ruby
    def up
      create_table :users do |t|
         #create columns: 't.column "first_name", :string, :limit =>30'
      end
    end

    def down
      drop_table(:some_name)
    end
    ```
3) Creates file in `app/models/«some_name».rb`
  - in file, creates Ruby class of `SomeName` (that inherits from `ActiveRecord::Base`)
4) File names, class names and table names all freaking matter
  - e.g. if we write code that needs to use a model of `Subject` then Rails will look in `app/model/subject.rb`. If that code needs to retrieve data from the database then Rails knows to look for a table called `:subjects`

###Rails Models
- Always reside in ./app/models
- Models inherit from `ActiveRecord::Base` to give them db powers
- if you change the name of a table in the migration files from "some_name" to "new_name" you can fix the Rails naming convention by:
  - change the `class «NewName»` in `app/models/«some_name.rb»`
  - change the file `app/models/«some_name.rb»` to  `....«new_name.rb»``
- In the `class «SomeName»` ActiveRecord creates *attribute-methods* that let you read/write for each column.

###Creating Records
- New/save record
  1. instantiate object
  2. Set Values
  3. Save
- Create record
  1. instantiate object, set values, save (one step!)

###Updating Records

###Finding Records
- **Primary Key Finder** - `Subject.find(«id_#»)`
  + **Dynamic Finder**  
     + `Subject.find_by_id(« id_# »)`
     + `Subject.find_by_name(« id_# »)`
     + `Subject.all`

  

