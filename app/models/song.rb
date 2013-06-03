class Song < ActiveRecord::Base
  attr_accessible :original_query, :thumbnail, :title, :youtube_id
  has_many :playlists_song
  has_many :playlists, :through => :playlists_song

  validate :title, :presence => true
  validate :original_query, :presence => true

end
