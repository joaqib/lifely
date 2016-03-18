class GoalController < ApplicationController
  def index
    @goals = Goal.all
    @tasks = Task.all
  end
end
