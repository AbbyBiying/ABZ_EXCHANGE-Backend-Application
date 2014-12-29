class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.references :listing, null: false
      t.references :offer, null: false

      t.timestamps
    end
  end
end
