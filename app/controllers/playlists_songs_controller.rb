class PlaylistsSongsController < ApplicationController
  def destroy
    playlist_song = PlaylistsSong.where(playlist_id: params["playlist_id"], song_id: params["song_id"])
    playlist_song.first.destroy
    redirect_to "/playlists/#{params["playlist_id"]}"
  end
end
