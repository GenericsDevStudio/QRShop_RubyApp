class User < ApplicationRecord
  def self.to_object(hash)
    user = User.new
    user.idU = hash['id'].to_i
    user.name = hash['name']
    user.login = hash['login']
    user.password = hash['password']
    user.cash = hash['cash'].to_i
    user.spend_cash = hash['spend_cash'].to_i
    user.updated_at = DateTime.new
    user.created_at = DateTime.new
    user
  end

end
