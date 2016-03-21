class Goal < ActiveRecord::Base
  has_many :tasks
  validates_presence_of :name

  accepts_nested_attributes_for :tasks
end
