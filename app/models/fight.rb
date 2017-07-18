class Fight < ActiveRecord::Base
    has_many :runs
    
    #Boss name should be present
    validates :boss, presence: true
    
    #Stamina should be present
    validates :stamina, presence: true,
                        inclusion: 0..60
    
    #Validates that the fight has stages
    validates :stages,  presence:true,
                        inclusion: 1..20

    #Validates that is either a Raid, Colosseum or Forest
    validates :category, presence: true
                         
    
end
