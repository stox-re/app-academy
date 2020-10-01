class SubsController < ApplicationController
  before_action :require_current_user!, only: [:new, :create, :edit, :update]

  def index
    @subs = Sub.all.order(created_at: :desc)
    render :index
  end

  def new
    render :new
  end

  def not_a_moderator_process(sub)
      flash[:errors] = ["You are not the moderator of this sub-forum"]
      redirect_to sub_url(sub.id)
  end

  def edit
    @sub = Sub.find_by({id: params[:id]})
    if current_user == @sub.moderator
      render :edit
    else
      not_a_moderator_process(@sub)
    end
  end

  def show
    @sub = Sub.find_by({id: params[:id]})
    render :show
  end

  def create
    @sub = Sub.new({title: params[:sub][:title], description: params[:sub][:description], moderator_id: current_user.id })
    if @sub.save
      redirect_to sub_url(@sub.id)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
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

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end