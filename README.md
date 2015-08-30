# Rails Setup

## Setting up the Environment
1. Install **Xcode**
  - We need a compiler ... XCode contains a compiler: GCC
  - get XCode at the app store
  - we care about the underlying command line tool, GCC
  - go to terminal and confirm that `gcc -v` gives you a version
  - also we need make, so confirm in command line `make-v`  

2. Install **homebrew**, **rbenv** and appropriate **ruby**
  - *[homebrew](https://www.homebrew.com)* is a package manager for Mac
    - run `brew doctor` and `brew update` to make sure that all is okay
  - see *[setup instructions](./setup-ruby-version.md)* to setup homebrew, rbenv, and correct ruby version  

3. Install **ruby gems** (if you don't have it)
  - `gem -v` will checkout the version
  - `gem list` will check out which gems are installed
  - `sudo gem update --system` makes sure we have the latest version 
  - checkout more at [rubygems.org](https://rubygems.org/)
  - ex: `sgem install will_paginate`  

4. Install **Ruby on Rails**
  - install *bundler* `gem install bundler` --- manages a gem's dependency gems
  - then we install *Rails* `gem install rails --no-ri --no-rdoc` 
    - `--no-ri` and `--no-rdoc` doesnt 
    - core gems of ruby on rails: actionpack, activerecord 
    - confirm the version with `rails -v`

5. Install **MySQL** and configure it with Rails
  - Install *MySQL* with `brew install mysql`
    - copy and paste code to laundh at startup and load right now
    
  - Set a default MYSQL
    - `mysql --version`
    -  create a password for the mysql root-folder with `mysqladmin -root password`
    -  access the root with : `mysql -u root -p` and enter the password
  
  - Install MySQL RubyGem with `gem install mysql2`

6. Time to install a **webserver**
  - *in production:* a user will type in our url in their browser, they will be connected to our webserver that will return a response to their request. the webserver will talk to our rails app to determine what to return  
  - *in development*: we will also use a webserver  
      
  - so which webserver?
    - Apache 1 or 2 - the most popular and ships with OS 10, Passenger/mod_rails
    - Nginx - lots of configuration options
    - Lighttpd
    - Mongrel
    - **WEBBrick** - we'll use this one. ships with rails. preinstalled and preconfigured. takes the browser request, talks to rails app, returns results

## Setting up a Rails Application
1. Create the project: 
  - Inside the directory where you plan to work, type `rails new «app_name» -d mysql`  
  - this sets up the initial project files, the database, and the dependency gems (using bundler)  
  - rails has out-of-the-box support for sqlite3, mysql, and postgresql and plugin support for others (oracle, ibm_db, frontbase)

2. Role of **[bundler](http://bundler.io)**
  - bundler cares about the files: `Gemfile` and `Gemfile.lock`
  - in `Gemfile`, we tell bunder what gems (i.e. what version) the project requires. Many gems require other gems to work so bundler will create a dependency tree of all the gems that need to be load
  - The dependency tree is in `Gemfile.lock` and you *never* edit this file.
  - the command `bundle install` will take the configurations in our Gemfile, turn them into a Gemfile.lock and fetch all the gems necessary from rubygems

3. Modify `Gemfile`
  - you can comment out the features you don't want

4. Accessing a Project
  1. Start webserver:  `rails server`
  2. Visit site in a browser @ http://localhost:3000
    - if using mysql2, this will start off with an *error* page 
    - should get *mysql::error* so we will need to configure the database
  3. open the config-file:  `./config/database.yml`
    - contains configuration for connecting to our database
    - note: make sure that all indentation is with spaces and properly aligned
    - under `development:`, you will likely have to comment out the `database` value since no database exists yet

# Getting the project on the page
We have to set up a Controller and a View
  - Browser communicates with the Controller 
  - Controller communicates with the View
  - the View goes back to the browser  

1. Setup the controller & view  

  In the console, type `rails generate controller «controller-name» «controller-view» «more_views»`  

  This creates the initial rails directories and filenames for the  controller and view. Sets up: 
    1. **Controller**: `./controllers/«controller-name»_controller.rb`
      -  A simple ruby class with a ruby method called `def index`. This is whatrenders the view for us.
      - `./app/controllers/demo_controler.rb` and also creates a `demo` directory in the View folder 
    
    2. **View**: `./app/views/«controller-name»/«controller-view».html.erb`
      -  This is where the ruby-html resides
      - `./app/views/demo/index.html.rb`  
    
    3. the connection between *Controller* and *Views* is handled through the router `./config/routes.rb` (method with a ruby-block that invokes `get 'demo/index'`)

### The Rails File Structure

- `app/`  - most important directory
  - `assets/`: 
    - `images/` , `javascript/` , `stylesheet` 
  - `models/`
  - `views/`
  - `helpers/` : code to help us with our views
  - `mailers/` : for sending emails
- `bin/` : `bundle`, `rails` ,rake`
- `config/` configuration code separate from the application code
  - `database.yml` : configuration to connect to db
  - `application.rb` : code specific to application as a whole
  - `environments/`
    - code specific to `development.rb`, `production.rb`, and `test.rb`
  - `initializers/`
  - `locales/` : for internationalization
- `db/` code for managing database...comes in handy for migrations
- `lib/`  : useful code carried from project to project
- `public/` - files are public. alteranate location for images and js
- `test/` - place for writing and storing test code
- `tmp/` - 

###Further study
- Routers, Controllers, Views, & Dynamic Content
- Models, Views, 
