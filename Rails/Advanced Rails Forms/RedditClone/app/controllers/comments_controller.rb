class CommentsController < ApplicationController
  before_action :require_current_user!, only: [:create, :destroy]

  def create
    params_to_pass = comment_params
    params_to_pass[:author_id] = current_user.id

    @comment = Comment.new(params_to_pass)
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_comment_url
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy!
      redirect_to posts_url
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to post_url(@post)
    end
  end

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end
end