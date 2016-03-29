class UsersController < ApplicationController

 before_action :authenticate_user!

  def show
    @user = current_user
    @goals = @user.goals
    @pie_data = Goal.pie_chart_data(@user)
  end
end
