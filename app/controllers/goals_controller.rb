class GoalsController < ApplicationController

  def index
    @goals = Goal.all
    @tasks = Task.all
  end

  def new
    @goal = Goal.new
    @task = @goal.tasks.new
    
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      flash[:notice] = "Goal created succesfully"
      redirect_to action: :index
    else
      render "new"
    end
  end

  def archive
    Goal.find(params[:id]).update_attributes(done: true)
    redirect_to goals_path
  end

  def show
    @goal = Goal.find(params[:id])
  end

  private
  def goal_params
    params.require(:goal).permit(:name, tasks_attributes: [:name])
  end


end
