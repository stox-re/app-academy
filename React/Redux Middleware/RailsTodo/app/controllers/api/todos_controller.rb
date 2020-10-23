class Api::TodosController < ApplicationController

  def show
    @todo = Todo.find_by({id: params[:id]})
    if @todo
      render json: @todo
    else
      render json: {success: false, message: "Could not find the todo with id: #{params[:id]}"}, status: 422
    end
  end

  def index
    render json: Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def update
    @todo = Todo.find_by({id: params[:id]})
    if @todo.update!(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages, status: 422
    end
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
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
