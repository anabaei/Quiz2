class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    input = params.require(:user).permit(:first_name, :last_name, :email, :password)
      if(User.create(input))
      
      session[:user_id] = User.last.id   
      redirect_to ideas_path, notice: 'Thank you for signing up!'   
       
      else 
       redirect_to new_user_path, alert: 'Something is wrong Try again!' 
      end 
  end

  def findit
    theuser = User.find_by(email: params[:email])
    
      if (theuser && theuser.authenticate(params[:password]))
        session[:user_id] = theuser.id
        redirect_to ideas_path, notice: 'you are login now' 
      else 
        redirect_to users_path, alert: 'Password and Email are not correct! Try again' 
      end 
  end

  def resetuser
    session[:user_id] = nil
    redirect_to ideas_path, notice: 'you Sign out!'
  end 

  def destroy 
  end

  def show
  end


  
end
