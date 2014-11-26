class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.references :location, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
