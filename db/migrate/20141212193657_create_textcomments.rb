class CreateTextcomments < ActiveRecord::Migration
  def change
    create_table :textcomments do |t|
      t.string :body

      t.timestamps
    end
  end
end
