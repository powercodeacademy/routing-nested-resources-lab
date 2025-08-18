class AddArtistToSong < ActiveRecord::Migration[7.1]
  def change
    add_reference :songs, :artist, index: true, foreign_key: true
  end
end
