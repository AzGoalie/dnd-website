class RemoveLevelFromCharacter < ActiveRecord::Migration
  def change
	remove_column :characters, :level
  end
end
