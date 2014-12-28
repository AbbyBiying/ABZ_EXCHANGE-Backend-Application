class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.text :description, null: false
      t.string :url

      t.timestamps
    end
  end
end
