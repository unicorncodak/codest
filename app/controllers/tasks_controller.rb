class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    @tasks = @tasks.filter_result(filter_params(params), params[:priority_op], @tasks)
    @order = Task::ORDER
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "Task created"
    else
      render :new
    end
  end

  def sort
    @tasks = Task.sort(params, current_user)
    params[:order] == "asc" ? @order = "desc" : @order = "asc"
    render :index
  end

  def destroy
    Task.find(params[:id]).destroy!
    redirect_to tasks_path, notice: "Task destroyed"
  end

  private

  def task_params
    params.require(:task).permit(:title, :priority)
  end

  def filter_params(params)
    params.slice(:query, :priority)
  end

end
