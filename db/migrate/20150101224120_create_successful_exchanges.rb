class CreateSuccessfulExchanges < ActiveRecord::Migration
  def change
    create_table :successful_exchanges do |t|
      t.references :exchange, null: false

      t.timestamps
    end
  end
end
