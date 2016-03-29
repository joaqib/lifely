class Goal < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  validates_presence_of :name

  accepts_nested_attributes_for :tasks

  def self.current_goals(user)
    Goal.where(user_id: user, done: false)
  end
end
