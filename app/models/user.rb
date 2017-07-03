class User < ActiveRecord::Base
    has_many :runs
    validates :name,    length: {maximum: 20},
                        presence: true
    validates :email,    length: {maximum: 30},
                        presence: true
end
