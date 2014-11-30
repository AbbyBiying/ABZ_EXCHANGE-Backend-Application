class CreateTextComments < ActiveRecord::Migration
  def change
    create_table :text_comments do |t|
      t.string :body

      t.timestamps
    end
  end
end
