class Tag < ActiveRecord::Base
  has_many :tag_tracks, :dependent => :destroy
  has_many :posts, :through => :tag_tracks
  
  default_scope :order => "tags.name"
end
