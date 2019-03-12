require 'uri'
require 'net/http'

class StaticPagesController < ApplicationController
  def index
    if !is_user?
      flash[:warning] = 'You should enter!'
      redirect_to users_log_in_path
    end
  end
end
