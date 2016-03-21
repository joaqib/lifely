class TasksController < ApplicationController
  before_action :set_goal
  before_action :set_item, except: [:create]

  def create
    @task = @goal.tasks.create(task_params)
    @task.save
    redirect_to @goal
  end

  private
  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_task
    @task = @goal.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @goal, notice: "Task completed"
  end
end
 