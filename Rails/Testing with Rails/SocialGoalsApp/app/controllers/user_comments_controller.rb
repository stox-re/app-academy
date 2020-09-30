class UserCommentsController < ApplicationController
  before_action :require_current_user!, only: [:create, :destroy]

  def create
    @comment = UserComment.new({
      body: params[:user_comment][:body],
      for_user_id: params[:user_comment][:for_user_id],
      author_id: current_user.id
    })
    if @comment.save
      redirect_to user_url(@comment.for_user_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_comment_user_url(params[:user_comment][:for_user_id])
    end
  end

  def destroy
    @comment = UserComment.find_by(id: params[:id])
    if @comment.author_id == current_user.id
      if @comment.destroy!
        redirect_to user_url(@comment.for_user_id)
      else
        flash[:errors] = @comment.errors.full_messages
        redirect_to user_url(@comment.user_id)
      end
    else
      flash[:errors] = ["Not your comment to delete"]
      redirect_to user_url(@comment.for_user_id)
    end
  end

  def user_comment_params
    params.require(:user_comment).permit(:body, :author_id, :for_user_id)
  end
end