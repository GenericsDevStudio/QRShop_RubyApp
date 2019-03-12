class ApplicationController < ActionController::Base
  def is_user?
    User.any?
  end
end
