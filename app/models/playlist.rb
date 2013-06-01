class Playlist < ActiveRecord::Base
  attr_accessible :access_token, :creator, :name
  has_many :playlists_song
  has_many :songs, :through => :playlists_song
end
