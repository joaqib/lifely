require 'rails_helper'

RSpec.describe Goal do

  let(:goal) {Goal.new(name: "test goal")}
  let(:task) {Task.new(name: "test task", date_assigned: Date.today, hours: 3, goal: goal)}

  it "the goal starts empty" do
    expect(goal.tasks).to be([])
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
        Task.new(name: "title#{i}", date_assigned: (Date.now - 10),hours: 3, goal: goal)
      end
    end

    it "goal does not show more than 10 tasks" do
      # this is a second confirmation that there is no more than 10 task created for each goal, validation also in Task model
      15.times do |i|
        Task.new(name: "title#{i}", date_assigned: (Date.now - 10),hours: 3, goal: goal)
      end

      expect(goal.weekly_tasks.length).to be(10)
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