class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.references :run, index: true, foreign_key: true
      t.text :description
      t.integer :number

      t.timestamps null: false
    end
  end
end
