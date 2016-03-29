class GoalsController < ApplicationController

 before_action :set_goal, except: [:index]
 before_action :authenticate_user!

  def index
    @goals = Goal.where(user_id: current_user, done: false)
    @goal = current_user.goals.new
  end

  def new
    @goal = current_user.goals.new
    @task = @goal.tasks.new
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to @goal, notice: 'Goal was successfully created.'
    else
      render :new 
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
