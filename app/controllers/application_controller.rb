class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    return unless session[:user_id]

    @current_user = User.find(session[:user_id])
  end
end
