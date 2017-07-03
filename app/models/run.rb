class Run < ActiveRecord::Base
    belongs_to :user
    belongs_to :fight
end
