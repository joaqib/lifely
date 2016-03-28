require 'rails_helper'

RSpec.describe Goal do

  let(:goal) {Goal.create(name: "test goal")}
  let(:task) {Task.create(name: "test task", date_planned: Date.today, hours_planned: 3, goal: goal.id)}

  it "the goal starts empty" do
    expect(goal.tasks).to eq([])
  end

  it "the goal have tasks" do
    task
    expect(goal.tasks.count).to be(1)
  end

  it "goal does not show old tasks" do
    task.date_assigned -= 10
    expect(goal.weekly_tasks).to be([])
  end


  it "goal does show new tasks" do
    expect(goal.weekly_tasks.length).to be(1)
  end

  describe "Goal with 5 tasks" do

    before :each do
      5.times do |i|
        Task.new(name: "title#{i}", date_planned: (Date.today - 10),hours: 3, goal: goal)
      end
    end

    it "Goal hibernate after one week of inactivity" do
      goal.update_status
      expect(goal).to have_attribute(status: "dead")

    end

    it "Goal survive because weekly activity" do
      goal.update_status
      expect(goal).to have_attribute(status: "live")
    end
  end

end