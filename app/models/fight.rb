class Fight < ActiveRecord::Base
    has_many :runs
    validates :fight, length: {maximum: 20}
end
