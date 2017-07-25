class Run < ActiveRecord::Base
  belongs_to :fight
  belongs_to :level
  belongs_to :user
  acts_as_votable
  
  #This set the order with created at runs appearing first
  default_scope -> {order(created_at: :desc)}
  
  #It should contain a user 
  validates :user_id, presence:true
  
  #It should contain a fight
  validates :fight_id, presence:true
  
  #It should contain a fight
  validates :level_id, presence:true
   
  #Validate captain_class
  validates :captain_class, presence:true, length: { maximum: 20}
  
  #Validates description 
  validates :description, length: { maximum: 500}
  
  #Validates that is a valid youtube url
  VALID_YOUTUBE_URL = /(?:http:\/\/)?(?:www\.)?youtube\.com\/watch\?v=([a-zA-Z0-9_-]*)/
  validates :youtube_url, presence:true, 
                          format: { with:VALID_YOUTUBE_URL }
  
  #Validates that the title is in format "2x (Captain), (crew1),(crew2),(crew3),(crew4) or (captain1) + (captain2),(crew1),(crew2),(crew3),(crew4) "
  VALID_TITLE_URL = /(\A2x([^,]*,){4}([^,]*)\z|\A([^,]*+)([^,]*,){4}([^,]*)\z)/
  validates :title, presence:true,
                    length: {maximum: 150},
                    format: { with:VALID_TITLE_URL, message:"should be 2x (Captain), (Crew#1), (Crew#2), (Crew#3), (Crew#4) for same captain teams or (Captain1) + (Captain2), (Crew#1), (Crew#2), (Crew#3), (Crew#4) for different captains"}
  
  #Validates that the server is a valid type
  validates :server,  presence:true
  
  #Return the id from the youtube url
  def youtube_id
    query_string = URI.parse(self.youtube_url).query
    parameters = Hash[URI.decode_www_form(query_string)]
    parameters['v']
  end  

                      
  
end
