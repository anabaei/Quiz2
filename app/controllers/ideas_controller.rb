class IdeasController < ApplicationController
  

  def index
    @ideas = Idea.all
    @idea = Idea.new
    
  end

  def new
    @idea = Idea.new
  end


  def create
  	input = params.require(:idea).permit(:title, :des)
    newidea = Idea.new(input)
    if(current_user)
    newidea.user_id = current_user.id
    end 
    if (newidea.save)
    redirect_to ideas_path, notice: 'Thank you for Creating new Comment' 
    else
    redirect_to new_idea_path, alert: 'sorry you comment didnt create' 
    end 
  end
 

  def edit
    @idea =  Idea.find(params.require(:id))
      if(@idea.user_id != current_user.id)
       redirect_to ideas_path, notice: 'you dont have authority to Edit this Idea'
      end 
  end 


   def update
     @idea =  Idea.find(params.require(:id))
     @idea.update params.require(:idea).permit(:title, :des)
     redirect_to ideas_path, notice: 'you successfully updated your Idea'
   end 

  def destroy

    @idea =  Idea.find(params.require(:id))
    if(@idea.user_id == current_user.id)
     @idea.destroy
     redirect_to ideas_path, notice: 'you successfully deleted your Idea'
    else
      redirect_to ideas_path, notice: 'you dont have authority to delete this Idea'
    end 
  end

  def likes
    
    id = params[:id]
    temp = Alllike.find_by(idea_id: id)
    # if(session[:old].to_i && session[:old].to_i != session[:user_id])
    #   session[:old] = session[:user_id]
     if(temp && temp.userid != session[:user_id] )
      
        if(temp)
          temp.cnt += 1
          temp.userid = session[:user_id]
          temp.save 
          redirect_to request.referrer, notice: "you like an idea!"
        else
           Alllike.create(idea_id: id,cnt: 0, userid: session[:user_id])
           redirect_to request.referrer, notice: "you like an idea!"
        end 
      else
        redirect_to request.referrer, notice: "Already liked it!"
      end 
   
    #   session[params[:id]] ||= 0
    #   session[:old] ||=0
    #   @likes[session[:old]] ||=0
    # if( session[:old].to_i == session[:user_id].to_i)
    #    redirect_to request.referrer, alert: "you already liked this idea!"
    # else
    #   #  session[params[:id]] = session[:user_id]
    #     session[:old] = session[:user_id]
    #     @likes[session[:old]] += 1
    #     # byebug
    #     session[params[:id]] += 1
    #     redirect_to request.referrer, notice: "you like an idea!"
    #end
  end 



  def show
    @idea = Idea.find params[:id]
    @review = Review.new 
    @reviews = Review.all
  end

  
end
