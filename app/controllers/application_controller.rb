class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
   
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
   helper_method :current_user

  def who(idea)
  	@author = User.find_by(id: idea.user_id)   
    if (@author)
  	  @author.first_name
    end
  end 
  helper_method :who
end
