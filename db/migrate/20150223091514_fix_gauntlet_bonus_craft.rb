class FixGauntletBonusCraft < ActiveRecord::Migration
  def change
  	remove_column :characters, :guantlets_bonus
	add_column :characters, :gauntlets_bonus, :integer, default: 0
  end
end
