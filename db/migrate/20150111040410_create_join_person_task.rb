class CreateJoinPersonTask < ActiveRecord::Migration
  def change
    create_table :people_tasks, :id => false do |t|
      t.integer :person_id
      t.integer :task_id
    end
  end
end
