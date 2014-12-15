class CreateTextcomments < ActiveRecord::Migration
  def change
    create_table :textcomments do |t|
      t.string :body
      t.belongs_to :user, index: true
      t.belongs_to :image

      t.timestamps
    end
  end
end
