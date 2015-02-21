class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.references :owner, index: true
      t.references :users, index: true

      t.timestamps null: false
    end
    add_foreign_key :campaigns, :owners
    add_foreign_key :campaigns, :users
  end
end
