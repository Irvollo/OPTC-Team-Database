class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.string :boss
      t.integer :stamina
      t.integer :stages
      t.string :category

      t.timestamps null: false
    end
  end
end
