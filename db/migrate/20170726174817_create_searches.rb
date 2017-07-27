class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :captain_class
      t.references :level, index: true, foreign_key: true
      t.references :fight, index: true, foreign_key: true
      t.string :server

      t.timestamps null: false
    end
  end
end
