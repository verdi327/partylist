class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :creator
      t.string :access_token

      t.timestamps
    end
  end
end
