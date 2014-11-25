class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :number, null: false, default: ""
      t.string :street, null: false, default: ""
      t.string :city, null: false, default: ""
      t.string :state, null: false, default: ""
      t.string :country, null: false, default: ""
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
