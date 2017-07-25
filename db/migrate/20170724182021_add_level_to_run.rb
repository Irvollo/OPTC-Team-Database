class AddLevelToRun < ActiveRecord::Migration
  def change
    add_reference :runs, :level, index: true, foreign_key: true
  end
end
