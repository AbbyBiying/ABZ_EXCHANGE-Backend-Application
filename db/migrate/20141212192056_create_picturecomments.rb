class CreatePicturecomments < ActiveRecord::Migration
  def change
    create_table :picturecomments do |t|
      t.string :url

      t.timestamps
    end
  end
end
