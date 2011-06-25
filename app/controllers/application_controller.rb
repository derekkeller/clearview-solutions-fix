class ApplicationController < ActionController::Base
  protect_from_forgery

  # before_filter :authenticate_user!

  def full_name(user)
    [user.first_name, user.last_name].join(" ")
  end

  def after_sign_in_path_for(resource)
      stored_location_for(resource) || investors_path
  end
    
end
