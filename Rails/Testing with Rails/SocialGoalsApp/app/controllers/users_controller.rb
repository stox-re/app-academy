class UsersController < ApplicationController
  def new
    render :new
  end

  def user_comment
    @users = User.all
    render :new_user_comment
  end

  def show
    @user = User.find_by({id: params[:id]})
    @user_comments = UserComment.where({for_user_id: params[:id]})
    if logged_in?
      if params[:id].to_i == current_user.id.to_i
        @goals = Goal.where({user_id: params[:id]})
      else
        @goals = Goal.where({user_id: params[:id], is_public: true})
      end
    else
      @goals = Goal.where({user_id: params[:id], is_public: true})
    end
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user.email, @user.password)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end