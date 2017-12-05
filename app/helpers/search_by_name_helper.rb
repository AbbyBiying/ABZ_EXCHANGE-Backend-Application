module SearchByNameHelper
  def find_by_name(search)
    where("name ILIKE ?", "%#{search}%")
  end
end