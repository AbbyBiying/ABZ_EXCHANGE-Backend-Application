class MakeCommentContents < ActiveRecord::Migration
  def change
    Comment.all.each do |comment|
      textcomment = textcomment.create!(body: comment.content)
      comment.content_type = "Textcomment"
      comment.content_id = textcomment.id
      comment.save!

      t.timestamps
    end
  end
end
