class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @task = Task.new
    @tasks = current_user.tasks.order("task_order")
  end
end
