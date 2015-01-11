class PersonsController < ApplicationController
  def show
    @person = Person.find params[:id]
  end
 
  def tags
    persons = Array.new
    current_user.organizations.each do |org|
      org.persons.each do |per|
        persons.push per
      end
    end
    render json: persons.to_json
  end

  def add_task
    @person = Person.find params[:person_id]
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      if params[:detail]
        @details = @task.task_details.build(details: params[:detail])
        @details.save
      end
      @person.tasks.push @task
      @person.save
    else
      flash[:notice] = "Failed to add task"
    end
    redirect_to @person

  end
  private
    def task_params
      params.require(:task).permit(:title, :organization_id)
    end
end
