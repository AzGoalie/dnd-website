class Character < ActiveRecord::Base
	belongs_to :owner, class_name: "User", foreign_key: "owner_id"
	belongs_to :campaign

	validates :name, presence: true, 
  					 length: { maximum: 20 }
  	validates :owner, presence: true
  	validates :campaign, presence: true
end
