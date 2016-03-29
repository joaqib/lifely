require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  
  let(:user) { FactoryGirl.create(:user) }
  let(:goal) { FactoryGirl.create(:goal) }

  describe "POST #create" do
    context "with valid attributes" do
      it "create new task" do
        expect { 
          post :create, task: attributes_for(:task), goal_id: goal
        }.to change { Task.count }.by(1) 
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "update task" do
        post :create, task: attributes_for(:task), goal_id: goal
        expect {
          patch :update, {task_id: Task.last, hours_worked: 2, id: goal.id}
        }.to change { Task.done }.by(1)
      end
    end
  end
end