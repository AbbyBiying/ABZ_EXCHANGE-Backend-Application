class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content_type
      t.integer :image_id
      t.integer :content_id
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
