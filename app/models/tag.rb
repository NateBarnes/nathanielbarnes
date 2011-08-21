class Tag < ActiveRecord::Base
  has_many :tag_tracks, :dependent => :destroy
  has_many :posts, :through => :tag_tracks
  
  default_scope :order => "tags.name"
  
  def published_posts
    pp = []
    posts.each { |p| pp << p if p.published_at < Time.now }
    pp
  end
end
