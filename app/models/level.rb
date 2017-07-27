class Level < ActiveRecord::Base
has_many :fights
has_many :runs
has_many :searches
    
  #It should contain a valid level type 
  validates :name, presence:true
    
end
