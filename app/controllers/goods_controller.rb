require 'uri'
require 'net/http'

class GoodsController < ApplicationController
  def index
    if !is_user?
      flash[:warning] = 'You should enter!'
      redirect_to users_log_in_path
    else
      uri = URI.parse('http://vasylko.zzz.com.ua/index.php/api/fdadmin')
      params = { login: 'login' }
      @goods = Array.new
      arr_gds = JSON.parse(Net::HTTP.post_form(uri, params).body)['good']
      arr_gds.each do |gd|
        @goods << Good.to_object(gd)
      end
    end
  end

  def new
    @good = Good.new
  end

  def edit
    if !is_user?
      flash[:warning] = 'You should enter!'
      redirect_to users_log_in_path
    else
      @good = Good.new
      @good.idG = params[:idG]
      @good.name = params[:name]
      @good.price = params[:price]
      @good.count = params[:count]
    end
  end

  def refresh
    if !is_user?
      flash[:warning] = 'You should enter!'
      redirect_to users_log_in_path
    else
      uri = URI.parse('http://vasylko.zzz.com.ua/index.php/api/Editgoods')
      Net::HTTP.post_form(uri, get_attributes_from_params(params[:good]))
      redirect_to goods_path
    end
  end

  def create
    if !is_user?
      flash[:warning] = 'You should enter!'
      redirect_to users_log_in_path
    else
      uri = URI.parse('http://vasylko.zzz.com.ua/index.php/api/Addgoods')
      Net::HTTP.post_form(uri, get_attributes_from_params(params[:good]))
      redirect_to goods_path
    end
  end

  def remove
    if !is_user?
      flash[:warning] = 'You should enter!'
      redirect_to users_log_in_path
    else
      puts params[:idG]
      uri = URI.parse('http://vasylko.zzz.com.ua/index.php/api/dellgoods')
      Net::HTTP.post_form(uri, { id: params[:idG]})
      redirect_to goods_path
    end
  end

  def show

  end

  private

  def good_attributes
    params.require(:good).permit(:name, :price, :count, :code)
  end

  def get_attributes_from_params(hash)
    good_params = {}
    good_params['name'] = hash[:name]
    good_params['price'] = hash[:price]
    good_params['count'] = hash[:count]
    if hash['code']
      good_params['code'] = hash[:code]
    end
    if hash['idG']
      good_params['id'] = hash[:idG]
    end
    good_params
  end
end
