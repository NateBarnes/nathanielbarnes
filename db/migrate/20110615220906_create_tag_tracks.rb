class CreateTagTracks < ActiveRecord::Migration
  def self.up
    create_table :tag_tracks do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_tracks
  end
end
