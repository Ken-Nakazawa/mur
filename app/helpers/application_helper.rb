module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def favorited? item_id
    !current_user.items.find_by(rakutenitem_id: item_id).nil?
  end
end
