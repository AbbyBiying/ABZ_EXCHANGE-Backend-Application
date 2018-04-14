module GroupsHelper
  def group_user_is_current_user?(group)
    group.user == current_user
  end

  def group_has_comments?(group)
    group.comments.any?
  end
end