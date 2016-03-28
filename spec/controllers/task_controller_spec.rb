require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  before(:all) do
    @user = FactoryGirl.create(:user)
    @goal = FactoryGirl.create(:goal)
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new task" do
        post :create, task: attributes_for(:task), goal_id: @goal 
        expect(Task.count).to eq(1)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "update task" do
        patch :update, task: Task.last, hours_worked: 2 
        expect(Task.where(done: true)).to eq(1)
      end
    end
  end
end