class NotesController < ApplicationController
	before_action :logged_in_user
	before_action :check_campaign, only: [:new, :create]
	before_action :get_campaign,   only: [:new, :create]
	before_action :private_note, only:[:show]
	before_action :check_user, only:[:show]
	before_action :check_edit, only:[:edit]

	helper_method :can_edit?

	respond_to :html, :json

	def new
		@note = Note.new
	end

	def create
		@note = Note.new(note_params)
		@note.user = current_user
		@note.campaign = Campaign.find(params[:campaign_id])
		if @note.save
			flash[:success] = "Note created!"
			redirect_to @note
		else
			render "new"
		end
	end

	def show
		@note =  Note.find(params[:id])
		@campaign = @note.campaign
	end

	def edit
		@campaign = @note.campaign
	end

	def update
		@note =  Note.find(params[:id])
		@note.update_attributes(note_params)
		respond_with @note
	end

	def destroy
		campaign = Note.find(params[:id]).campaign 
		Note.find(params[:id]).destroy
    	flash[:success] = "Note deleted"
    	redirect_to campaign
	end

	def can_edit?
		@note = Note.find(params[:id])
		return current_user == @note.user
	end

	private
		def note_params
			params.require(:note).permit(:title, :body, :private)
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

		def private_note
			@note = Note.find(params[:id])
			if @note.private? 
				redirect_to root_url unless(current_user == @note.user)
			end
		end

		def check_user
			@note = Note.find(params[:id])
			if (current_user != @note.campaign.owner && !@note.campaign.users.include?(current_user))
				redirect_to root_path
				flash[:danger] = "You are not part of this campaign"
			end
		end

		def check_edit
			if !can_edit?
				redirect_to root_path
				flash[:danger] = "You are not the owner of this note"
			end
		end
end
