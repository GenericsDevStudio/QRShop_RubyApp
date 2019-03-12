require 'uri'
require 'net/http'

class UsersController < ApplicationController
  def index
    if !is_user?
      flash[:warning] = 'You should enter!'
      redirect_to users_log_in_path
    else
      uri = URI.parse('http://vasylko.zzz.com.ua/index.php/api/fdadmin')
      params = { login: 'login' }
      @users = Array.new
      arr_us = JSON.parse(Net::HTTP.post_form(uri, params).body)['users']
      arr_us.each do |us|
        @users << User.to_object(us)
      end
    end
  end

  def log_in
    if !is_user?
      @user = User.new
    else
      flash[:warning] = 'You are entered!'
      redirect_to root_url
    end
  end

  def log_out
    User.first.destroy
    redirect_to users_log_in_path
  end

  def create
    if !is_user?
      @user = User.new
      @user.login = params[:user][:login]
      @user.save
      redirect_to root_path
    else
      flash[:warning] = 'You cannot enter!'
      redirect_to users_log_in_path
    end
  end
end
