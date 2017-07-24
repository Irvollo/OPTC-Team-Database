class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.references :level, index: true, foreign_key: true
      t.integer :stamina
      t.string :boss
      t.integer :stages

      t.timestamps null: false
    end
  end
end
