class Good < ApplicationRecord

  def self.to_object(hash)
    good = Good.new
    good.idG = hash['id'].to_i
    good.name = hash['name']
    good.price = hash['price'].to_i
    good.code = hash['code']
    good.count = hash['count'].to_i
    good.updated_at = DateTime.new
    good.created_at = DateTime.new
    good
  end
end
