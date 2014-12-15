class AddContentTypeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :content_type, :string
  end
end
