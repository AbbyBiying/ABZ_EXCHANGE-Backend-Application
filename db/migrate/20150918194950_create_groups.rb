class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.references :user, null: false
      t.references :comment
      t.text :description, null: false
      t.references :location

      t.timestamps null: false
    end
  end
end
