class TaskDetailsController < ApplicationController
  before_action :set_task_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @task_details = TaskDetail.all
    respond_with(@task_details)
  end

  def show
    respond_with(@task_detail)
  end

  def new
    @task_detail = TaskDetail.new
    respond_with(@task_detail)
  end

  def edit
  end

  def create
    @task_detail = TaskDetail.new(task_detail_params)
    @task_detail.save
  end

  def update
    @task_detail.update(task_detail_params)
    respond_with(@task_detail)
  end

  def destroy
    @task_detail.destroy
    redirect_to :back
  end

  private
    def set_task_detail
      @task_detail = TaskDetail.find(params[:id])
    end

    def task_detail_params
      params.require(:task_detail).permit(:details, :task_id)
    end
end
