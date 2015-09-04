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
Let's say we have a table called `Subject`

We can create db records in **two ways.** 
- Instantiate => Set Values => Save
  ```ruby
  subject = Subject.new()
  subject.first_name = "Travis"
  subject.last_name = "Hubbard"
  subject.age = 31

  subject.save

  ##  ALSO: mass assignment ##
  subject = Subject.new(
    :first_name => "Travis",
    :last_name => "Hubbard",
    :age => 31
  )

  subject.save
  ```

- Create (instantiate, set values, and save with `.create`)
  ```ruby
  subject = Subject.create(
    :first_name => "Travis",
    :last_name => "Hubbard",
    :age => 31  
  )

  #....and we're done
  ```

###Finding Records
- **Primary Key Finder** 
  - Example: `Subject.find(«id_#»)`
  - *Returns a single object or an error*
- **Dynamic Finder**  
     +  Example:  
       `Subject.find_by_id(«id_#»)`  
       `Subject.find_by_first_name(«first_name»)` 
       `Subject.find_by_age(«age»)`
     +  *Returns a single object or nil* 
- **Find All method**
  - `subjects = Subject.all`
  - Returns the entire table of subjects as an array
- `Subject.last` - pulls the last record

###Updating Records
1. One-at-a-time  
  ```ruby
  subject = Subject.find_by_name("Travis")
  subject.name = "Billy"
  subject.save
    # returns `true` if save was successful and `false` if not
    # subject.updated_at gets updated also
  ```
2.  Multiple -- updates multiple attributes and saves the record
```ruby
subject.update_attributes(
  name: "Bobby",
  age: 33,
  ugly: false
)  
```
###Query Conditions & Methods  

#####Query Conditions - `.where`
- Structure = `Subject.where( «conditions» )`  

- Returns an ActiveRecord object which can be chained
  - `Subject.where(:visible => true).order("position ASC").limit(100).offset(12)`
  - `Subject.where(:visible => true).to_sql` *returns a string of the SQL req*

- Does not execute a database call immediately
  - Expression Types
  - String:
    - Flexible, raw SQL...but use carefully and beware of SQL injection
    - Ex: `"name= '#{first_name}' AND visible = true"`
  - Array
    - Flexible, escaped SQL, safe from SQL Injection
    - any time we want to drop a value in, we provide a `?` as a placeholder for where that value should go
    - Ex: `["name = ? AND visible = true", "First Subject" ]`
    - supports OR, LIKE, less than/greater than
  - Hash
    - `{:name => "First Subject", :visible => true}`
    - Each key-value pair will be joined with an AND
    - But.... doesn't support OR, LIKE, less than/greater than
    - Only supports equality, range, and subset checking 

#####Example
```ruby
#with chained arrays
subjects = Subject.where(["visible = ?", true]).where(["position = ?", 1 ])

#with single hash
subjects = Subject.where(:visible => true, :position => 1)
```

##### Query Methods - `.order` , `.limit` , `.offset`
- `.where(«search_condition»).order(«SQL_format»)`
  - **Order SQL Format: ** `table_name.column_name ASC/DESC` 
    - ASC = ascending , DESC = descending  
    
    + Necessary to *disambiguate* the columns on joined tables (because there may be a identically-named columns in more than one table)
    - Example:  `«...».order("subjects.visible DESC, subjects.name ASC")` 
- `.limit` : limits number of records returned
- `.offset`: determines number of records skipped
- Complete Example: - `Subject.where(:visible => true).order("subjects.position ASC").limit(100).offset(12)`

###Named Scopes for Custom Queries
- custom queries that are defined in a model 
- Defined using ActiveRelation query methods.
- Can be called like built-in ActiveRelation methods (e.g. `Subject.find(x)`)
- Can accept parameters
- Rails 4 requires lambda syntax
  - `scope :get_active, lambda { where(:active=>true) }`
  - same as...  
    ```ruby
      def self.active
        where(:get_active => true)
      end
    ```
- We would then be able call it like this: 
  `Subject.get_active`  
  (in the same way that we call an ActiveRelation method)
  

 