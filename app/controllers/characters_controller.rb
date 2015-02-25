class CharactersController < ApplicationController
	before_action :logged_in_user
	before_action :check_campaign, only: [:new, :create]
	before_action :get_campaign,   only: [:new, :create]

	respond_to :html, :json

	def new
		@character = Character.new
	end

	def create
		@character = Character.new(character_params)
		@character.owner = current_user
		@character.campaign = Campaign.find(params[:campaign_id])
		if @character.save
			flash[:success] = "Character created!"
			redirect_to @character
		else
			render "new"
		end
	end

	def show
		@character = Character.find(params[:id])
	end

	def update
		@character = Character.find params[:id]
		@character.update_attributes(character_params)
		respond_with @character
	end

	def destroy
		campaign = Character.find(params[:id]).campaign 
		Character.find(params[:id]).destroy
    	flash[:success] = "Character deleted"
    	redirect_to characters_campaign_path(campaign)
	end
	
	private
		def character_params
			params.require(:character).permit!
		end

		def get_campaign
			@campaign = Campaign.find(params[:campaign])
			if current_user != @campaign.owner && !@campaign.users.include?(current_user)
				redirect_to root_path
				flash[:danger] = "You are not part of the campaign"
			end
		end

		def check_campaign
			if !params.has_key? :campaign
				flash[:danger] = "Need a campaign as a parameter"
				redirect_to root_path
			end
		end
end
