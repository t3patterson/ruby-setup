class User < ActiveRecord::Base
	scope :visible, lambda{  where(:visible => true )  }
	scope :invisible, lambda {  where(:visible)=> false  }
	scope :sorted, lambda { order("users.position ASC")  }
	scope :search, lambda{|query| where{["name LIKE ?", "%#{query}%"]}}
    
    # we can now execute:
    #   - User.visible
    #   - User.invisible
    #   - User.search("Tra")
    #   - User.visible.sorted
    # 
end
