class TasksController < ApplicationController
  before_action :set_goal
  before_action :set_task, except: [:create]

  def create
    @task = @goal.tasks.create(task_params)
    @task.save
    redirect_to goals_path
  end

  def update
    @task.update_attributes(done: true, hours_worked: params[:task][:hours_worked])
    redirect_to :back, notice: "Task completed"
  end

  private
  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def set_task
    @task = @goal.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :hours_planned, :hours_worked)
  end
end
 