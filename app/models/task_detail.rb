class TaskDetail < ActiveRecord::Base
  belongs_to :task

  validates_presence_of :details

  before_save :associate_users

  def associate_users
    persons = Array.new
    self.task.user.organizations.each do |org|
      org.persons.each do |per|
        persons.push per
      end
    end
    persons.each do |pers|
      if self.details.match(/#{pers.name}/)
        begin
          self.task.persons.push pers
        rescue => exp

        end
      end
    end
    self.details.gsub!(/\@\[\[\d\:\:/," ") 
    self.details.gsub!(/\]\]/, " ") 
    begin 
      self.task.save 
    rescue => exp

    end
  end
end
