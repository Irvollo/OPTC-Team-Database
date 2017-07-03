class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :fight_id
      t.integer :user_id
      t.string :title
      t.string :run_desc
      t.integer :duration
      t.string :captain_type
      t.string :youtube_url
      t.string :db_team_url

      t.timestamps null: false
    end
  end
end
