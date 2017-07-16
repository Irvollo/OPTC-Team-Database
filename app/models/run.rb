class Run < ActiveRecord::Base
  belongs_to :fight
  belongs_to :user
end
