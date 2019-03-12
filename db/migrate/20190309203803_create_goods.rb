class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.string :name
      t.integer :price
      t.string :code
      t.integer :count

      t.timestamps
    end
  end
end
