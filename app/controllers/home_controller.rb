class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @task = Task.new
    @tasks = current_user.tasks.order("task_order")
  end

  def contacts
    names = Organization.where("name like '%#{params[:q]}%'").collect(&:name) + Person.where("name like '%#{params[:q]}%'").collect(&:name) 
    render json: names.to_json
  end

  def navigation
    key = params[:key]

    if Organization.find_by_name(key)
      redirect_to Organization.find_by_name(key)
    elsif Person.find_by_name(key)
      redirect_to Person.find_by_name(key)
    else
      render text: "Invalid text"
    end
  end
end
