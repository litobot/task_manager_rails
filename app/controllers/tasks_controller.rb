class TasksController < ApplicationController
  def index
    @tasks = Task.all
    binding.pry
  end

  def new
  end

  def create # Create a hash in the Task class? 
    task = Task.new({
      title: params[:title],            # What are these?
      description: params[:description] # What are these?
    })
    task.save   # This saves the new task that's created?
    redirect_to '/tasks'  # After saving the new task we are redirected to the tasks link?
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update({
      title: params[:title],
      description: params[:description]
      })
    task.save
    redirect_to "/tasks/#{task.id}"
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to '/tasks'
  end
end