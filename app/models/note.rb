class Note < ActiveRecord::Base
	belongs_to :user
	belongs_to :campaign

	validates :title, presence: true, 
			  length: { maximum: 50 }
	validates :user, presence: true
	validates :campaign, presence: true
end
