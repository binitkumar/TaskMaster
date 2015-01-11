class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy, :update_order]

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
  
  def add_task
    @organiation = Organization.find params[:task][:organization_id]
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      if params[:task_detail]
        @details = @task.task_details.build(details: params[:task_detail])
        @details.save
      end
    else
      flash[:notice] = "Failed to add task"
    end
    redirect_to @task.organization
  end

  def index
    @organizations = Organization.all
    respond_with(@organizations)
  end

  def show
    respond_with(@organization)
  end

  def new
    @organization = Organization.new
    respond_with(@organization)
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.user = current_user
    @organization.save
    respond_with(@organization)
  end

  def update
    @organization.update(organization_params)
    respond_with(@organization)
  end

  def destroy
    @organization.destroy
    respond_with(@organization)
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :products, persons_attributes: [:id, :name, :_destroy])
    end

    def task_params
      params.require(:task).permit(:title, :organization_id)
    end
end
