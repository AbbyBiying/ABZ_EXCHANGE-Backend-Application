module OrderHelper
  def by_most_recent
    order(created_at: :desc)
  end
end