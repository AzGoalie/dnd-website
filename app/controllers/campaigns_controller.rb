class CampaignsController < ApplicationController
	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = current_user.owned_campaigns.build(campaign_params)
		@campaign.owner = current_user
        
		if @campaign.save
			flash[:success] = "#{@campaign.title} created!"
			redirect_to @campaign
		else
			render 'new'
		end
	end

	def show
		@campaign =  Campaign.find(params[:id])
	end

	private
		def campaign_params
          params.require(:campaign).permit(:title, :description, :private, :user_ids => [])
        end
end
