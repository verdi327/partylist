class SearchesController < ApplicationController
  def create
    search_term = params["query"]
    @playlist = Playlist.find(params["playlist_id"])
    results = Search.where("query ? :key", :key => search_term)
    if results.empty?
      Search.create_from_youtube(search_term)
      @search_results = Search.last.video_results
    else
      @search_results = results.first.video_results
    end
    respond_to do |format|
      format.html { render :template => 'playlists/show' }
      format.js
    end
  end
end
