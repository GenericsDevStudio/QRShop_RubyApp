class AddIdU < ActiveRecord::Migration[5.2]
  def change
     add_column :goods, :idG, :integer
  end
end
