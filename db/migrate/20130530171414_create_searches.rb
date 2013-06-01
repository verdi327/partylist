class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.hstore :query

      t.timestamps
    end
  end
end
