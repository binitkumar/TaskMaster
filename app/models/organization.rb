class Organization < ActiveRecord::Base
  has_many :persons
  has_many :tasks
  belongs_to :user
  accepts_nested_attributes_for :persons, :reject_if => :all_blank, :allow_destroy => true
end
