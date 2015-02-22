module CampaignsHelper
	def in_campaign?
		@campaign.users.include?(current_user) || is_owner?
	end

	def is_owner?
		current_user == @campaign.owner
	end
end
