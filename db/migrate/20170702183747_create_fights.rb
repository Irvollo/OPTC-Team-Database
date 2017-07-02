class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.string :fight
      t.integer :stamina
      t.integer :stages
      t.string :server

      t.timestamps null: false
    end
  end
end
