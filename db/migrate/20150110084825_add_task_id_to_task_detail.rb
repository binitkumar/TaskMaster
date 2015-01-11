class AddTaskIdToTaskDetail < ActiveRecord::Migration
  def change
    add_column :task_details, :task_id, :integer
  end
end
