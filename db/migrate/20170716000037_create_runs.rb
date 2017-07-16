class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.references :fight, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :captain_class
      t.text :description
      t.string :youtube_url
      t.string :title
      t.string :server

      t.timestamps null: false
    end
    add_index :runs, [:created_at, :user_id]
  end
end
