class GoalsController < ApplicationController
  before_action :require_current_user!, only: [:show, :new]

  def index
    @public_goals = Goal.where({is_public: true})
    render :index
  end

  def new
    render :new
  end

  def edit
    @goal = Goal.find_by({id: params[:id]})
    render :edit
  end

  def show
    @goal = Goal.find_by({id: params[:id]})
    if @goal.is_public
      render :show
    elsif @goal.user_id == current_user.id
      render :show
    else
      redirect_to goals_url
    end
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal.id)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to new_goal_url
    end
  end

  def update
    update_goal = Goal.find_by({id: params[:id]})
    if update_goal.update!(goal_params)
      redirect_to goal_url(update_goal.id)
    else
      flash[:errors] = update_goal.errors.full_messages
      redirect_to edit_goal_url(update_goal.id)
    end
  end

  def destroy
    @goal = Goal.find_by(id: params[:id])
    if @goal.destroy!
      redirect_to user_url(@goal.user_id)
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to user_url(@goal.user_id)
    end
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :is_public)
  end
end