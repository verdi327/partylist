class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :thumbnail
      t.string :original_query

      t.timestamps
    end
  end
end
