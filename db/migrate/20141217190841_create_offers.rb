class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.text :description, null: false
      t.references :counteroffer
      t.string :url

      t.timestamps
    end
  end
end
