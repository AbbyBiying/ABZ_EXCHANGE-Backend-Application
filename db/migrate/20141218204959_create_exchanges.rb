class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.references :listing, null: false
      t.references :offer, null: false

      t.timestamps
    end
  end
end
