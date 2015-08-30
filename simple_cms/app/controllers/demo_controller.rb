
#inherits from ApplicationController
class DemoController < ApplicationController
  
  layout false

   # these are the Actions 
   #  (a method that the controller will 
   #    execute based on the route)
  
  #matches the :action portion of the route
  def index 
  	# do some shit....
  	

  	# ...THEN as a default behavior, 
  	#     render the `index.html.erb` template
  	#     that matches the route
  end



  def hello
    #however, we can change which template to render
  	render('demo/lost-in-time')
  	  # will render `.../demo/lost-in-time.html.erb  
  end

  def lost_in_time
    #however, we can change which template to render
  	@id_num = params['id']
    @page_num = params[:page]
  	render('demo/lost-in-time')
  	  # will render `.../demo/lost-in-time.html.erb  
  end



  def dynamic_ruby
    render('dynamic-ruby')
  end

  def instance_var_ex
    @instance_var_1 = [
      "this is really",
      "interesting",
      "dont you htink?",
      "i am not in this `instance_var.html.erb`",
      "however, I am readable from the controller!",
      "i.e. - the action instance_var_in_template "
    ]

    render('instance_var_templ')
  end


  def other_hello
  	redirect_to(:controller => 'demo', :action => 'durrr-durr')
  end

  def send_me_away
  	redirect_to("http://deadspin.com/")
  end

end
