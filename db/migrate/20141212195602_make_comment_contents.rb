class MakeCommentContents < ActiveRecord::Migration
  def change
    Comment.all.each do |comment|
      text_comment = text_comment.create!(body: comment.content)
      comment.content_type = "TextComment"
      comment.content_id = text_comment.id
      comment.save!

      t.timestamps
    end
  end
end
