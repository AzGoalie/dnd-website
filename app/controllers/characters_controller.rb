class CharactersController < ApplicationController
	before_action :logged_in_user
	before_action :check_campaign, only: [:new, :create]
	before_action :get_campaign,   only: [:new, :create, :edit, :update]

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
	end

	def destroy
		campaign = Character.find(params[:id]).campaign 
		Character.find(params[:id]).destroy
    	flash[:success] = "Character deleted"
    	redirect_to characters_campaign_path(campaign)
	end

	private
		def character_params
			params.require(:character).permit(:name)
		end

		def get_campaign
			@campaign = Campaign.find(params[:campaign])
		end

		def check_campaign
			redirect_to root_path unless params.has_key? :campaign
		end
end
