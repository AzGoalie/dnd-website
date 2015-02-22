class AddCharactersRefToCampaigns < ActiveRecord::Migration
  def change
    add_reference :campaigns, :characters, index: true
    add_foreign_key :campaigns, :characters
  end
end
