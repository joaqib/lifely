class GoalsController < ApplicationController

 before_action :set_goal, except: [:index, :new, :create]
 before_action :authenticate_user!

  def index
    @goals = Goal.current_goals(current_user)
    @goal = current_user.goals.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @goal.save
    respond_to do |format|
      format.html { redirect_to goals_path }
      format.js
    end
  end

  def archive
    @goal.update_attributes(done: true)
    redirect_to goals_path, notice: "Goal successfully archive"
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end
  def goal_params
    params.require(:goal).permit(:name, tasks_attributes: [:name])
  end
end
