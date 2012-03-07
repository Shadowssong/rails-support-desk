class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery


  def require_admin
    unless current_user.try(:is_admin?)
      flash[:error] = "Only admin's can do that."
      redirect_to root_path
    end
  end
end
