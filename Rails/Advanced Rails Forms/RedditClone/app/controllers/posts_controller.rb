class PostsController < ApplicationController
  before_action :require_current_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @subs = Sub.all
    render :new
  end

  def show
    @post = Post.find_by({id: params[:id]})
    render :show
  end

  def edit
    @sub = Sub.find_by({id: params[:id]})
    if current_user == @sub.moderator
      render :edit
    else
      not_a_moderator_process(@sub)
    end
  end

  def create
    @post = Post.new({
      title: params[:post][:title],
      url: params[:post][:url],
      content: params[:post][:content],
      sub_id: params[:post][:sub_id],
      author_id: current_user.id
    })
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def update
    @sub = Sub.find_by({id: params[:id]})
    if current_user == @sub.moderator
      if @sub.update(sub_params)
        redirect_to sub_url(@sub.id)
      else
        flash[:errors] = @sub.errors.full_messages
        redirect_to edit_sub_url(@sub.id)
      end
    else
      not_a_moderator_process(@sub)
    end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end
end