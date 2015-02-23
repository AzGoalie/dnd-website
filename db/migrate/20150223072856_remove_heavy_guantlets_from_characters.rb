class RemoveHeavyGuantletsFromCharacters < ActiveRecord::Migration
  def change
	remove_column :characters, :heavy_guantlets
	remove_column :characters, :heavy_guantlets_bonus

	add_column :characters, :heavy_gauntlets, :integer, default: 0
	add_column :characters, :heavy_gauntlets_bonus, :integer, default: 0
  end
end
