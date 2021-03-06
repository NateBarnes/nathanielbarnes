class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tag_tracks, :foreign_key => "post_id", :dependent => :destroy
  has_many :tags, :through => :tag_tracks
  has_many :comments, :dependent => :destroy
  
  default_scope :order => "posts.published_at DESC"
  named_scope :from_month, lambda { |month| {:conditions => {:published_at => month..(month + 1.month)}} }
  
  def self.published
    self.find(:all, :conditions => [ "published_at < ?", DateTime.now ])
  end
end
