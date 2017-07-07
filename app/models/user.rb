class User < ActiveRecord::Base
    before_save {email.downcase!}
    
    has_many :runs
    
    validates :name,    length: {maximum: 50},
                        presence: true
                        
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,    length: {maximum: 255},
                        presence: true,
                        format: { with:VALID_EMAIL_REGEX}, 
                        uniqueness: { case_sensitive: false}
                        
    has_secure_password 
    
    validates :password,    length: { minimum: 6},
                            presence: true
end