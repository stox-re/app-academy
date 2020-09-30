class GoalCommentsController < ApplicationController
  before_action :require_current_user!, only: [:create, :destroy]

  def create
    @goal_comment = GoalComment.new({
      body: params[:goal_comment][:body],
      goal_id: params[:goal_comment][:goal_id],
      author_id: current_user.id
    })
    if @goal_comment.save
      redirect_to goal_url(@goal_comment.goal_id)
    else
      flash[:errors] = @goal_comment.errors.full_messages
      redirect_to goal_comment_goal_url(params[:goal_comment][:goal_id])
    end
  end

  def destroy
    @goal_comment = GoalComment.find_by(id: params[:id])
    if @goal_comment.author_id == current_user.id
      if @goal_comment.destroy!
        redirect_to goal_url(@goal_comment.goal_id)
      else
        flash[:errors] = @goal_comment.errors.full_messages
        redirect_to goal_url(@goal_comment.goal_id)
      end
    else
      flash[:errors] = ["Not your comment to delete"]
      redirect_to goal_url(@goal_comment.goal_id)
    end
  end

  def user_comment_params
    params.require(:goal_comment).permit(:body, :author_id, :goal_id)
  end
end