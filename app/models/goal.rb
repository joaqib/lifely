class Goal < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  validates_presence_of :name

  accepts_nested_attributes_for :tasks

  def self.current_goals(user)
    Goal.where(user_id: user, done: false)
  end

  def self.pie_chart_data(user)
    @goals = Goal.where(user_id: user)
    total_planned = 0
    total_worked = 0
    @goals.each do |goal|
      goal.tasks.each do |task|
        total_planned += task.hours_planned
        total_worked += task.hours_worked
      end
    end
    arr = {"Hours Planned" => total_planned, "Hours Worked" => total_worked }
  end
end
