module ApplicationHelper
  def all_tags
    return Tag.all
  end
  
  def archives
    @archives = Post.all.group_by { |t| t.created_at.beginning_of_month}
  end
end
