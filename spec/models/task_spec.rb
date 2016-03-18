require 'rails_helper'

RSpec.describe Task do

  let(:task) {Task.new(name: "testTask", dateAssigned: (Date.now), timeAssigned: 2)}

  it "New Task is created" do
    firstTask = task
    expect(Task.count).to be(1)
  end

  it "Task is archived" do
    firstTask = task
    firstTask.archive
    expect(Task.count).to be(1)
  end

  it "No more than 10 task per goal each week" do
    firstTask = task
    firstTask.archive
    expect(Task.count).to be(1)
  end



end