class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.references :offer, null: false
      t.references :counter_offer, null: false

      t.timestamps
    end
  end
end
