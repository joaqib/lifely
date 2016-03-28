class SiteController < ApplicationController
  def index
    if user_signed_in?
      redirect_to goals_path
    end
  end
end
