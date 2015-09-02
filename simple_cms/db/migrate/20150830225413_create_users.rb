 class CreateUsers < ActiveRecord::Migration
  # def change
  #   create_table :users do |t|

  #     t.timestamps null: false
  #   end
  # end

  def up
	  create_table :users do |t|
	  #t has been yielded by codeblock

	         #column-name     #data-type   #options
  	  t.column "first_name", :string  , :limit => 30
  	      #in MYSQL string will become VARCHAR
      
      #alternative 
      t.string "last_name", :limit => 25


      t.column "email", :string, :default => "", :null => false, :limit =>30
      t.column "password", :string, :limit => 20 

      t.timestamps null: false

      #  same as ....
      # t.column "created_at", :datetime
      # t.column "updated_at", :datetime
    end
  end

  def down
  	drop_table :users
  end
end
