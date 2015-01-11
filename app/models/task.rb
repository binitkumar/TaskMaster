class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization

  has_many :task_details, ->{ order("created_at asc") }
  validates_presence_of :title
end
