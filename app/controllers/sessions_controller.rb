class SessionsController < ApplicationController
  def new
  end

  def destroy
    log_out
    redirect_to root_url
  end

private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
