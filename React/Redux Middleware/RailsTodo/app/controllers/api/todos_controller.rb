class Api::TodosController < ApplicationController
  before_action :require_current_user!, only: [:show, :index, :create, :update, :destroy]

  def show
    @todo = Todo.find_by({id: params[:id]})
    if @todo
      render json: @todo
    else
      render json: {success: false, message: "Could not find the todo with id: #{params[:id]}"}, status: 422
    end
  end

  def index
    #render json: Todo.all.order(created_at: :asc)
    render json: current_user.todos.order(created_at: :asc)
  end

  def create
    @todo = current_user.todos.new(todo_params)
    #@todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def update
    @todo = current_user.todos.find_by({id: params[:id]})
    #@todo = Todo.find_by({id: params[:id]})
    if @todo.update!(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = current_user.todos.find_by({id: params[:id]})
    #@todo = Todo.find_by(id: params[:id])
    if @todo.destroy!
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end


  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end
end
