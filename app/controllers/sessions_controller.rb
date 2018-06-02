class SessionsController < ApplicationController
  def new
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end
end
