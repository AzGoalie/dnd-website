class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.references :owner, index: true
      t.references :users, index: true

      t.timestamps null: false
    end
  end
end
