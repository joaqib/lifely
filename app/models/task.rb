class Task < ActiveRecord::Base
  belongs_to :goal

  validates :hours_planned, numericality: { greater_than_or_equal_to: 0.5, less_than: 8}
  validates_presence_of :name
  validates :goal_id, numericality: {only_integer: true}

  scope :done, -> { where(done: true) }
  scope :not_done, -> { where(done: false) }

  def self.clean
    Task.where(done: false, created_at: (Time.now.midnight - 7.day)).each do |task|
      task.update_attribute(done: true, hours_worked: 0, date_planned: Time.now.midnight)
    end
  end

end
