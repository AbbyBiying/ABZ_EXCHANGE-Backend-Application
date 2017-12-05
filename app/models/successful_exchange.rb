class SuccessfulExchange < ActiveRecord::Base
  belongs_to :exchange
  has_many :comments, as: :commentable

  delegate :listing, to: :exchange
  delegate :offer, to: :exchange
 
  extend OrderHelper
  include TimeFormatHelper
  extend SearchByNameHelper

end
