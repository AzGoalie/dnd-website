class AddCharactersRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :characters, index: true
    add_foreign_key :users, :characters
  end
end
