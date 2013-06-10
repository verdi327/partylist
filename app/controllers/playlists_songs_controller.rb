class PlaylistsSongsController < ApplicationController
  def destroy
    @song = Song.find(params["song_id"])
    playlist_song = PlaylistsSong.where(playlist_id: params["playlist_id"], song_id: params["song_id"]).first
    playlist_song.destroy
    respond_to { |format| format.js }
  end
end

#need to figure out why when I do a full reload of the page, the destroy js no longer works
