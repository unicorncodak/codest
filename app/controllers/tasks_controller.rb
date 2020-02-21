class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
    # filter tasks by title if query param is present
    if params[:query].present?
      @tasks = @tasks.where("title LIKE '%#{params[:query]}%'")
    end
    if params[:priority].present?
      filtered_tasks = []
      @tasks.map.with_index { |a, i|
        filtered_tasks << a if a.priority.send(params[:priority_op], params[:priority].to_i)
      }
      @tasks = filtered_tasks
    end
    # uncomment next line in development to limit search result (faster page load)
    # @tasks = @tasks[0, 5]
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to tasks_path, notice: "Task created"
    else
      render :new
    end
  end

  def destroy
    Task.find(params[:id]).destroy!
    redirect_to tasks_path, notice: "Task destroyed"
  end

  private

  def task_params
    params.require(:task).permit!
  end
end
