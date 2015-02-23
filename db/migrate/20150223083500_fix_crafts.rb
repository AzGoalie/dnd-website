class FixCrafts < ActiveRecord::Migration
  def change
  	add_column :characters, :flails_c, :integer, default: 0
  	add_column :characters, :flails_c_bonus, :integer, default: 0

  	add_column :characters, :mallets_c, :integer, default: 0
  	add_column :characters, :mallets_c_bonus, :integer, default: 0

  	add_column :characters, :spears_c, :integer, default: 0
  	add_column :characters, :spears_c_bonus, :integer, default: 0

  	add_column :characters, :bows_c, :integer, default: 0
  	add_column :characters, :bows_c_bonus, :integer, default: 0

  	add_column :characters, :firearms_c, :integer, default: 0
  	add_column :characters, :firearms_c_bonus, :integer, default: 0
  end
end
