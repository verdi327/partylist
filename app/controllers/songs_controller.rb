class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    song = Song.new(:youtube_id => params["id"], :thumbnail => params["pic"], :title => params["t"])
    if song.save
      PlaylistsSong.create(:song_id => song.id, :playlist_id => params["playlist_id"])
    else
      flash[:notice] = "The song could not be saved!"
    end
    redirect_to "/playlists/#{params["playlist_id"]}"
  end
end
