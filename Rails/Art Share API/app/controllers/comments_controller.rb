class CommentsController < ApplicationController
  def index
    render json: params
  end

  def create
    comment = Comment.new(comments_params)
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

  def comments_params
    params.require(:comments).permit(:artwork_id, :user_id, :body)
  end

  def is_nil_message
    render json: { errors: ['Comment does not exist'] }, status: :unprocessable_entity
  end
end