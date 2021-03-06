class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  private

  # Overwriting the Devise sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
end
