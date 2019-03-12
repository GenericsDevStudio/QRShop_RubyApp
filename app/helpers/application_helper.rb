module ApplicationHelper
  def is_user_helper?
    User.any?
  end
end
