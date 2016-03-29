require 'rails_helper'

RSpec.describe Goal do

  let(:goal) { Goal.create(name: "test goal") }
  let(:task) { Task.create(name: "test task", date_planned: Date.today, hours_planned: 3, goal: goal)}

  it { validate_presence_of :name }

  it "the goal starts empty" do
    expect(goal.tasks).to eq([])
  end

  it "the goal have tasks" do
    task
    expect(goal.tasks.count).to be(1)
  end

  it "goal does show new tasks" do
    expect(Goal.current_goals.length).to be(1)
  end

end