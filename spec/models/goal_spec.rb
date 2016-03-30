require 'rails_helper'

RSpec.describe Goal do
  let(:user) { User.create(name: "test user") }
  let(:goal) { Goal.create(name: "test goal", user_id: 1) }
  let(:task) { Task.create(name: "test task", date_planned: Date.today, hours_planned: 3, goal: goal)}

  it { validate_presence_of :name }

  it "the goal starts empty" do
    expect(goal.tasks).to eq([])
  end

  it "the goal have tasks" do
    task
    expect(goal.tasks.count).to be(1)
  end

  it "the goal show current tasks" do
    goal
    expect(Goal.current_goals(1).count).to be(1)
  end
  

end