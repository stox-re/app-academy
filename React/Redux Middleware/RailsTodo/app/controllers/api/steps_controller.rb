class Api::StepsController < ApplicationController

  def index
    @steps = Step.where({todo_id: params[:todo_id]})
    if @steps
      render json: @steps
    else
      render json: {success: false, message: "Could not find the step with todo_id: #{params[:id]}"}, status: 422
    end
  end

  def create
    @step = Step.new(step_params)
    if @step.save
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def update
    @step = Step.where({id: params[:id]})
    puts "Updating from controller"
    puts @step
    if @step.update(step_params)
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def destroy
    puts "Params incoming"
    puts params
    @step = Step.find_by(id: params[:id])
    if @step.destroy
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end


  def step_params
    params.require(:step).permit(:title, :done, :todo_id)
  end
end
