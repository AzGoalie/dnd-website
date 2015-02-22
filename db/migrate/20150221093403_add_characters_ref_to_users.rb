class AddCharactersRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :characters, index: true
  end
end
