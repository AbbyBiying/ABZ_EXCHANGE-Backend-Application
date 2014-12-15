class CreatePictureComments < ActiveRecord::Migration
  def change
    create_table :picture_comments do |t|
      t.string :url

      t.timestamps
    end
  end
end
