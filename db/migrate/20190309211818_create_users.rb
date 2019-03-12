class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :idU
      t.string :name
      t.string :login
      t.string :password
      t.integer :cash
      t.integer :spend_cash

      t.timestamps
    end
  end
end
