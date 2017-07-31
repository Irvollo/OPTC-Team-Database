class Stage < ActiveRecord::Base
  belongs_to :run
  
  validates :run_id, presence: true
  
  validates :number, presence:true,
                     inclusion: 1..20
                     
  validates :description, length: { maximum: 500}
end
