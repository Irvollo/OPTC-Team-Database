class Search < ActiveRecord::Base
  #attr_accessor :keywords, :level_id, :fight_id, :captain_class, :server 
  belongs_to :level
  belongs_to :fight
  
  def runs
    @runs ||= find_runs
  end
  
  private
  
  def find_runs
    runs = Run.order(:title)
    runs = runs.where("title like ?", "%#{keywords}%") if keywords.present?
    runs = runs.where(level_id: level_id) if level_id.present?
    runs = runs.where(fight_id: fight_id) if fight_id.present?
    runs = runs.where(server: server) if server.present?
    runs = runs.where(captain_class: captain_class) if captain_class.present?
    runs
  end
  
end
  