class TaskDetail < ActiveRecord::Base
  belongs_to :task

  validates_presence_of :details
end
