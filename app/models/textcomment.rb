class Textcomment < ActiveRecord::Base
  has_one :comment, as: :content
end
