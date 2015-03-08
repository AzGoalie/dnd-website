module CharactersHelper
	def can_edit?
		@character = Character.find(params[:id])
		return (current_user == @character.owner || current_user == @character.campaign.owner)
	end
end