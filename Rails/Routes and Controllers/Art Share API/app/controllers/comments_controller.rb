class CommentsController < ApplicationController
  def index
    if params[:user_id] != nil
      comment = Comment.find_by({user_id: params[:user_id]})
      render json: comment
    elsif params[:artwork_id] != nil
      comment = Comment.find_by({artwork_id: params[:artwork_id]})
      render json: comment
    else
      render json: { errors: "Could not find the comment." }, status: :unprocessable_entity
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    if comment == nil
      is_nil_message
    else
      if comment.destroy
        render json: comment
      else
        render json: { errors: comment.errors_full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:artwork_id, :user_id, :body)
  end

  def is_nil_message
    render json: { errors: ['Comment does not exist'] }, status: :unprocessable_entity
  end
end