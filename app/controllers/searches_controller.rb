class SearchesController < ApplicationController
  def create
    search_term = params["query"]
    @playlist = Playlist.find(params["playlist_id"])
    results = Search.where("query ? :key", :key => search_term)
    if results.empty?
      Search.create_from_youtube(search_term)
      @results = Search.last.video_results
    else
      @results = results.first.video_results
    end

    render :template => 'playlists/show'
  end
end
