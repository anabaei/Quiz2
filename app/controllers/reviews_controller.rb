class ReviewsController < ApplicationController
  
  def index

  end

  def new
  end

  def create
     ideaid = params.require(:idea_id)
    # #check later without permit 
      newcomment = Review.new(params.require(:review).permit(:body)) 
    
     newcomment.idea_id = ideaid
     newcomment.user_id = current_user.id
     # @post = Post.find params[:post_id]
    # newcomment = @post.comments.build(params.require(:comment).permit(:body))
   # @answer.user = current_user

    if(newcomment.save)
     redirect_to request.referrer
    end 
  end

  def show
  end

  def destroy
    @review = Review.find(params[:id])
    if(@review.user_id == current_user.id)
       @review.destroy
       redirect_to request.referrer, alert: 'the comment successfully deleted!'
    else 
     redirect_to request.referrer, alert: 'Something went wrong! you may not have authority to delete it!'
    end
  end
end
