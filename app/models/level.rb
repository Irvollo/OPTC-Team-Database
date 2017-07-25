class Level < ActiveRecord::Base
has_many :fights
has_many :users
    
  #It should contain a valid level type 
  validates :name, presence:true
    
end
