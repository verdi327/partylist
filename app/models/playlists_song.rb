class PlaylistsSong < ActiveRecord::Base
  attr_accessible :playlist_id, :song_id
  belongs_to :playlist
  belongs_to :song
end
