module ApplicationHelper
  def all_tags
    return Tag.all
  end
  
  def archives
    @archives = Post.published.group_by { |t| t.published_at.beginning_of_month}
  end
end
