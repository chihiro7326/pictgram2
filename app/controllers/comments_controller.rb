class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end
  
  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    @comment.message = params[:message]
    
    if @comment.save
      redirect_to topics_path, success: 'コメントしました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:user_id, :topic_id, :message)
  end
  
end
