class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.boolean :private
	  t.references :user, index: true
	  t.references :campaign, index: true

      t.timestamps null: false
    end
  end
end
