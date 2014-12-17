class CreateCounteroffers < ActiveRecord::Migration
  def change
    create_table :counteroffers do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.text :description, null: false
      t.references :offer
      t.string :url

      t.timestamps
    end
  end
end
