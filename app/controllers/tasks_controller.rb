class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_filtered_params, only: %i[index]

  def index
    @tasks = TaskFilter.call(@filter_params, params[:priority_op], current_user.tasks)
    @order = Task::ORDER
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task created'
    else
      render :new
    end
  end

  def sort
    @tasks, @order = Task.sort(params, current_user)
    render :index
  end

  def destroy
    Task.find(params[:id]).destroy!
    redirect_to tasks_path, notice: 'Task destroyed'
  end

  private

  def task_params
    params.require(:task).permit(:title, :priority)
  end

  def set_filtered_params
    @filter_params = filter_params
  end

  def filter_params
    params.slice(:query, :priority)
  end
end
