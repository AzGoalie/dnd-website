class CharactersController < ApplicationController
	before_action :logged_in_user
	before_action :check_campaign, only: [:new, :create]
	before_action :get_campaign,   only: [:new, :create]
	before_action :check_user,	   only: [:show]
	before_action :check_edit,	   only: [:update, :edit]

	helper_method :can_edit?

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
	end

	def update
		@character.update_attributes(character_params)
		@campaign = @character.campaign
		respond_with @character
	end

	def edit
		@character = Character.find(params[:id])
		@campaign = @character.campaign
	end

	def destroy
		@campaign = Character.find(params[:id]).campaign 
		Character.find(params[:id]).destroy
    	flash[:success] = "Character deleted"
    	redirect_to characters_campaign_path(@campaign)
	end

	def in_campaign?
		@character = Character.find(params[:id])
		@campaign = @character.campaign
		return (current_user == @campaign.owner || @campaign.users.include?(current_user))
	end

	def can_edit?
		@character = Character.find(params[:id])
		return (current_user == @character.owner || current_user == @character.campaign.owner)
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

		def check_user
			@character = Character.find(params[:id])
			if !in_campaign?
				redirect_to root_path
				flash[:danger] = "You are not part of this campaign"
			end
		end

		def check_edit
			if !can_edit?
				redirect_to root_path
				flash[:danger] = "You are not the owner of this character"
			end
		end
end
