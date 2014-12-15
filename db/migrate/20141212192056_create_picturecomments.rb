class CreatePicturecomments < ActiveRecord::Migration
  def change
    create_table :picturecomments do |t|
      t.string :url
      t.belongs_to :user, index: true
      t.belongs_to :image

      t.timestamps
    end
  end
end
