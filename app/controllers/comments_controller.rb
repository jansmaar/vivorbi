class CommentsController < ApplicationController
 def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.new(params[:comment].permit(:content))
    @comment.user = current_user
    @comment.save
    redirect_to @event
    @user_name = @comment.user.firstname
  end

  def show
  	@comment = Comment.find(params[:id])
  end


	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

	def new
		@comment = Comment.new
	end


private
	def comments_params
		params.require(:comment).permit(:content, :event_id, :user_id)
	end
end
