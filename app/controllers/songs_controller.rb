class SongsController < ApplicationController

  def create
    @song = Song.new(:youtube_id => params["id"], :thumbnail => params["pic"], :title => params["t"])
    @playlist = Playlist.find(params["playlist_id"])
    if @song.save
      PlaylistsSong.create(:song_id => @song.id, :playlist_id => params["playlist_id"])
    else
      flash[:notice] = "The song could not be saved!"
    end
    respond_to do |format|
      format.js
    end
  end
end
