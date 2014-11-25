class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.string :url, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
