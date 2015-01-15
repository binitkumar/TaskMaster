class Task < ActiveRecord::Base

  belongs_to :user
  belongs_to :organization
  has_and_belongs_to_many :persons
  has_many :task_details, ->{ order("created_at asc") }


  after_create :associate_users

  def associate_users
    persons = Array.new
    self.user.organizations.each do |org|
      org.persons.each do |per|
        persons.push per
      end
    end
    persons.each do |pers|
      if self.title && self.title.match(/#{pers.name}/)
        begin
          pers.tasks.push self
        rescue => exp
          puts exp.message
        end
      end
    end
    self.title.gsub!(/\@\[\[\d\:\:/," ") 
    self.title.gsub!(/\]\]/, " ") 
  end
end
