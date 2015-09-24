##Associations

###The Big 3
- **One-to-One**
  - ClassRoom "has one" Teacher , Teacher "belongs to" a ClassRoom  
  ```ruby
  Room 105 --- Martha Cook
  ```
  - The **foreign key** goes on the "belongs to" (i.e. teacher's table )

-**One-to-many**
  - Teacher "has many" Courses, but a Course "belongs to" a Teacher  
  ```
                |-- Algebra
  Martha Cook ==|-- Geometry
                |-- Physics
  ```
  The **foreign key** goes on the courses table.

-*Many-to-Many*
  - a Course "has many" Students, a Student "has many" Courses and "belongs to many"  Courses 
  -To capture the relationship btw courses/students that have a many-to-many relationship, we use a **join table** -- a table that sits in the middle and holds 2 foreign keys.

####ActiveRecord Associations
We always have to define both sides of the relationship.
- **one-to-one**
  - `Classroom has_one :teacher`
  - `Teacher belongs_to :classroom`

- **one-to-many**
  - `Teacher_has many :courses`
  - `Course belongs_to :teacher`

- **many-to-many**
  - `Course has_and_belongs_to_many :students`
  - `Student has_and_belongs_to_many :courses`

###One-to-one Associations
  - Used for *unique items* a person or thing can have only one of
    - `Employee has_one :office`
    - `Student has_one :id_card`
  - Sometimes used to break up a single table
    - `Customer has_one :billing_address`
    - `Stage has_one :lighting_configuration`
  
  not used very often... usually one-to-many

