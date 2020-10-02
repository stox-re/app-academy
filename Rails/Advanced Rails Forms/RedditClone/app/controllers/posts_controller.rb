class PostsController < ApplicationController
  before_action :require_current_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(updated_at: :desc)
    @subs = Sub.all.order(created_at: :desc)
    render :index
  end

  def new_comment
    @post = Post.find_by({id: params[:id]})
    render :new_comment
  end

  def new
    @subs = Sub.all
    render :new
  end

  def show
    @post = Post.find_by({id: params[:id]})
    render :show
  end

  def edit
    @subs = Sub.all
    @post = Post.find_by({id: params[:id]})
    if current_user == @post.author
      render :edit
    else
      not_your_post_process(@post)
    end
  end

  def create
    params_to_pass = post_params
    params_to_pass[:author_id] = current_user.id
    @post = Post.new(params_to_pass)
    if @post.save
      params[:post][:sub_ids].each do |sub_id|
        PostSub.create({sub_id: sub_id.to_i, post_id: @post.id })
      end
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def update
    @post = Post.find_by({id: params[:id]})
    if current_user == @post.author
      if @post.update(post_params)
        redirect_to post_url(@post)
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to edit_post_url(@sub)
      end
    else
      not_your_post_process(@post)
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


  def not_your_post_process(post)
    flash[:errors] = ["This is not your post to edit"]
    redirect_to post_url(post)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end