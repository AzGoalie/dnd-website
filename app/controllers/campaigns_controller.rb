class CampaignsController < ApplicationController
	before_action :logged_in_user

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

	def index
		@campaigns = Campaign.paginate(page: params[:page])
	end

	def show
		@campaign =  Campaign.find(params[:id])
	end

	def destroy
		Campaign.find(params[:id]).destroy
    	flash[:success] = "Campaign deleted"
    	redirect_to campaigns_url
	end

	private
		def campaign_params
          params.require(:campaign).permit(:title, :description, :private, :user_ids => [])
        end
end
