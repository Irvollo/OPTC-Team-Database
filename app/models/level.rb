class Level < ActiveRecord::Base
has_many :fights
    
  #It should contain a valid level type 
  validates :name, presence:true
    
end
