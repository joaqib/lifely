class GoalsController < ApplicationController

 before_action :set_goal, only: [:show, :edit, :update, :destroy]

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

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    Goal.find(params[:id]).update_attributes(done: true)
    redirect_to goals_path, notice: "Goal successfully archive"
  end

  def show
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end
  def goal_params
    params.require(:goal).permit(:name, tasks_attributes: [:name])
  end
end
