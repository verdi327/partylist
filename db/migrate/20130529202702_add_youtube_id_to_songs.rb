class AddYoutubeIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :youtube_id, :string
  end
end
