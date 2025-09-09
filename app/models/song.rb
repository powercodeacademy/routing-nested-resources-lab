class Song < ApplicationRecord
  belongs_to :artist, optional: true

  def artist_name
    try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name) unless name.blank?
    self.artist = artist
  end
end
