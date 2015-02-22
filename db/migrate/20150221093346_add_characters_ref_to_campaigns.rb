class AddCharactersRefToCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :characters, index: true
  end
end
