class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.active == true
      '/dashboard'
    else
      plans_path
    end
  end

end
