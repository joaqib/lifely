class Task < ActiveRecord::Base
  belongs_to :goal

  validates_presence_of :name, :hours_planned, :goal_id

  def clean
    Task.where(done: false, created_at: (Time.now.midnight - 7.day)).each do |task|
      task.update_attribute(done: true, hours_worked: 0, date_planned: Time.now.midnight)
    end
  end

end
