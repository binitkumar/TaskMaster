class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html


  def update_order
    tasks = Array.new
    counter = 0
    params[:tasks].each do |obj|
      task_id = obj.split("_")[-1]
      task = Task.find task_id
      task.task_order = counter
      task.save
      counter += 1
    end
    render text: ""
  end

  def index
    @tasks = current_user.tasks.order("task_order")
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.save
    if params[:task_detail]
      @details = @task.task_details.build(details: params[:task_detail])
      @details.save
    end
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :organization_id)
    end
end
