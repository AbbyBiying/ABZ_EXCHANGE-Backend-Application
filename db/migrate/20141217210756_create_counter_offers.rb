class CreateCounterOffers < ActiveRecord::Migration
  def change
    create_table :counter_offers do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.text :description, null: false
      t.references :offer
      t.string :url

      t.timestamps
    end
  end
end
