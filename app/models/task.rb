class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_and_belongs_to_many :persons
  has_many :task_details, ->{ order("created_at asc") }
  validates_presence_of :title

end
