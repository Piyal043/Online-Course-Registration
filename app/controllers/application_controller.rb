class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to root_path
    end
  end

end
