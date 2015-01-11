class CreateTaskDetails < ActiveRecord::Migration
  def change
    create_table :task_details do |t|
      t.text :details

      t.timestamps
    end
  end
end
