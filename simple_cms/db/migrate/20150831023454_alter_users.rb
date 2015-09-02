class AlterUsers < ActiveRecord::Migration
  def up
  	rename_table("users", "admin_users")
  	add_column("admin_users", "username", :string, :limit=>25, :after=>"email")
  	change_column("admin_users", "email", :string, :limit => 33)
 	rename_column("admin_users", "password", "hashed_password")
 	puts "adding an index"
 	add_index("admin_users","username") #you want to add indexes on all foreign keys
  end

  def down
 	remove_index("admin_users","username") #you want to add indexes on all foreign keys
 	rename_column("admin_users", "hashed_password", "password")
  	change_column("admin_users", "email", :string, :default => "", :null => false, :limit =>30)
  	remove_column("admin_users", "username")
  	puts "column remove"
  	rename_table("admin_users", "users")
  end
end
