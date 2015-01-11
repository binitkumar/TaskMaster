class AddIndexToJoinTable < ActiveRecord::Migration
  def change
    add_index :people_tasks, [:person_id, :task_id], :unique => true
  end
end
