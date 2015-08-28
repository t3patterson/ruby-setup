# Rails Setup - Up and Rolling With Easy Demo

## Setting up the Environment
1. Install Xcode
  - We need a compiler ... XCode contains a compiler: GCC
  - get XCode at the app store
  - we care about the underlying command line tool, GCC
  - go to terminal and confirm that `gcc -v` gives you a version
  - also we need make, so confirm in command line `make-v`  

2. Install *homebrew*, *rbenv* and appropriate *ruby version*
  - *[homebrew](https://www.homebrew.com)* is a package manager for Mac
    - run `brew doctor` and `brew update` to make sure that all is okay
  - see *[setup instructions](./setup-ruby-version.md)* to setup homebrew, rbenv, and correct ruby version  

3. Install *ruby gems* (if you don't have it)
  - `gem -v` will checkout the version
  - `gem list` will check out which gems are installed
  - `sudo gem update --system` makes sure we have the latest version 
  - checkout more at [rubygems.org](https://rubygems.org/)
  - ex: `sgem install will_paginate`  

4. Install `Ruby on Rails`
  - install *bundler* `gem install bundler` --- manages a gem's dependency gems
  - then we install *Rails* `gem install rails --no-ri --no-rdoc` 
    - `--no-ri` and `--no-rdoc` doesnt 
    - core gems of ruby on rails: actionpack, activerecord 

5. MySQL
  - Install *MySQL* with `brew install mysql`
    - copy and paste code to laundh at startup and load right now
    
  - Set a default MYSQL
    - `mysql --version`
    -  create a password for the mysql root-folder with `mysqladmin -root password`
    -  access the root with : `mysql -u root -p` and enter the password
  
  - Install MySQL RubyGem with `gem install mysql2`

6. Time to install a webserver
  - *in production:* a user will type in our url in their browser, they will be connected to our webserver that will return a response to their request. the webserver will talk to our rails app to determine what to return
  - *in development*: we will also use a webserver  
      
  - so which webserver?
    - Apache 1 or 2 - the most popular and ships with OS 10, Passenger/mod_rails
    - Nginx - lots of configuration options
    - Lighttpd
    - Mongrel
    - WEBBrick - we'll use this one. ships with rails. preinstalled and preconfigured. takes the browser request, talks to rails app, returns results



