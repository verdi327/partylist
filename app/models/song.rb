class Song < ActiveRecord::Base
  attr_accessible :original_query, :thumbnail, :title, :youtube_id
  has_many :playlists_song
  has_many :playlists, :through => :playlists_song

  validate :title, :presence => true
  validate :original_query, :presence => true

  class << self
    def create_from_youtube(query)
      response = client.videos_by(:query => clean(query)).videos.first
      title          = response.title
      thumbnail      = response.thumbnails.first.url
      youtube_id     = response.unique_id
      original_query = clean(query)
      new(:title => title, :thumbnail => thumbnail, :youtube_id => youtube_id, :original_query => original_query)
    end
  end


end
