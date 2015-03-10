class CampaignsController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user, only: [:destory,:update, :edit]
	before_action :private_game, only:[:show]
	before_action :check_user, only:[:characters, :notes]

	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = current_user.owned_campaigns.build(campaign_params)
		@campaign.owner = current_user
		@campaign.users.push(current_user)
        
		if @campaign.save
			flash[:success] = "#{@campaign.title} created!"
			redirect_to @campaign
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @campaign.update_attributes(campaign_params)
			flash[:success] = "Campaign Updated"
			redirect_to @campaign
		else
			render 'edit'
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

	def characters
		@campaign = Campaign.find(params[:id])
	end

	def notes
		@campaign = Campaign.find(params[:id])
	end

	private
		def campaign_params
          params.require(:campaign).permit(:title, :description, :owner_id, :private, :user_ids => [])
        end

		def correct_user
			@campaign = Campaign.find(params[:id])
			redirect_to root_url unless (current_user.admin?) || (current_user == @campaign.owner)
		end

		def private_game
			@campaign = Campaign.find(params[:id])
			if @campaign.private? 
				redirect_to root_url unless(@campaign.users.include?(current_user) || (current_user == @campaign.owner))
			end
		end

		def check_user
			@campaign = Campaign.find(params[:id])
			if (current_user != @campaign.owner && !@campaign.users.include?(current_user))
				redirect_to root_path
				flash[:danger] = "You are not part of this campaign"
			end
		end
end
