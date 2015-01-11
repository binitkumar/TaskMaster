class UpdateOrderColumnNameFromTask < ActiveRecord::Migration
  def change
    rename_column :tasks, :order, :task_order
  end
end
