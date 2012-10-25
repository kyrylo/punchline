class AddArtistIdToLyrics < ActiveRecord::Migration
  def change
    add_column :lyrics, :artist_id, :integer
    add_index :lyrics, :artist_id
  end
end
